defmodule Pulap.Auth.User do
  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Auth.User

  schema "users" do
    field :annotations, :string
    field :card, :string
    field :created_by_id, Ecto.UUID
    field :email, :string
    field :family_name, :string
    field :geolocation, Geo.Point
    field :given_name, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :middle_names, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :started_at, :utc_datetime
    field :updated_by_id, Ecto.UUID
    field :username, :string

    timestamps()
    # Roles
    has_many :user_roles, Pulap.Auth.UserRole,
      on_delete: :nothing
    many_to_many :roles, Pulap.Auth.Role,
      join_through: Pulap.Auth.UserRole,
      on_delete: :nothing
    # Profile
    has_one :profile, Pulap.Auth.Profile,
      on_replace: :update,
      on_delete: :delete_all
    # Organizations
    has_many :organizations, Pulap.Auth.Organization,
      on_delete: :delete_all
    # Tenures
    has_many :tenures, Pulap.Biz.Tenure,
      on_delete: :delete_all
    many_to_many :employers, Pulap.Auth.Organization,
      join_through: Pulap.Auth.Tenure,
      on_delete: :delete_all
    # Real estates
    many_to_many :real_estates, Pulap.Biz.RealEstate,
      join_through: Pulap.Biz.Administratorship,
      on_delete: :delete_all
  end

  # @doc false
  # def changeset(%User{} = user, attrs) do
  #   user
  #   |> cast(attrs, [:username, :password, :password_hash, :email, :given_name, :middle_names, :family_name, :card, :annotations, :geolocation, :started_at, :created_by_id, :updated_by_id :is_active, :is_logical_deleted])
  #   |> validate_required([:username, :password, :password_hash, :email, :given_name, :middle_names, :family_name, :card, :annotations, :geolocation, :started_at, :created_by_id, :updated_by_id, :is_active, :is_logical_deleted])
  # end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :email, :given_name, :middle_names, :family_name])
    |> validate_required([:username, :password, :email, :given_name, :middle_names, :family_name])
  end

  @doc false
  def signup_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :email, :given_name, :middle_names, :family_name])
    |> validate_required([:username, :password, :email])
    |> validate_length(:username, min: 4, max: 16)
    |> validate_length(:password, min: 8, max: 32)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_email()
    |> hash_password()
  end

  def validate_email(changeset) do
    case changeset do
      %Ecto.Changeset{changes: %{email: email}} when is_binary(email) ->
        case Regex.run(~r/^[A-Za-z0-9_%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, email) do
          nil ->
            changeset |> add_error(:email, "Invalid email.")
          [email] ->
            try do
              Regex.run(~r/(\w+)@([\w.]+)/, email) # |> validate_domain_and_unique(changeset)
              changeset
            rescue
              _ ->
                changeset |> add_error(:email, "Invalid email.")
            end
          end
      _ ->
        changeset |> add_error(:email, "Invalid email.")
      end
  end

  def validate_domain_and_unique([email, username, host], changeset) do
    # accepted_domains = Config.accepted_domains # FIX: Commented only for development
    accepted_domains = ~w(localhost.com gmail.com hotmail.com)
    case host in accepted_domains do
      true ->
        case find_by_email(email) do
          nil ->
            changeset
          _account ->
            changeset |> add_error(:email, "Email is already registered.")
        end
      _ ->
        changeset |> add_error(:email, "Not an accepted domain.")
    end
  end

  def find_by_email(email) do
    Pulap.Auth.get_user_by_email!(email)
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
        #put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpass(pass, salt))
      _ ->
        changeset
    end
  end

end

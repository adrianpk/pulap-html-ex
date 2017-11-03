defmodule Pulap.Biz.Tenure do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pulap.Biz.Tenure


  schema "tenures" do
    field :ends_at, :utc_datetime
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :job_description, :string
    field :job_title, :string
    field :started_at, :utc_datetime
    field :organization_id, :id
    field :user_id, :id
    field :created_by_id, :id
    field :updated_by_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Tenure{} = tenure, attrs) do
    tenure
    |> cast(attrs, [:job_title, :job_description, :started_at, :ends_at, :is_active, :is_logical_deleted])
    |> validate_required([:job_title, :job_description, :started_at, :ends_at, :is_active, :is_logical_deleted])
  end
end

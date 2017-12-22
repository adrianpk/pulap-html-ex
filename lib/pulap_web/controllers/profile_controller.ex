defmodule PulapWeb.ProfileController do
  import List
  import Ecto.Query

  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Profile
  alias Pulap.Auth.User
  alias Pulap.Auth.Profile

  def index(conn, _params) do
    profiles = Auth.list_profiles()
    render(conn, "index.html", profiles: profiles)
  end

  def new(conn, _params) do
    changeset = Auth.change_profile(%Profile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"profile" => profile_params}) do
    user = conn |> user_from_session(:include_profile)
    case Auth.create_profile(profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile created successfully.")
        |> redirect(to: user_profile_path(conn, :show, user, profile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, _params) do
    user = user_from_params(conn)
    profile = user |> profile_from_user
    # profile = Auth.get_profile!(id)
    render(conn, "show.html", user: user, profile: profile)
  end

  def edit(conn, %{"user_id" => user_id}) do
    user = user_from_params(conn)
    profile = user |> profile_from_user
    changeset = Auth.change_profile(profile)
    render(conn, "edit.html", user: user, profile: profile, changeset: changeset)
  end

  def update(conn, %{"profile" => profile_params}) do
    user = conn |> user_from_session(:include_profile)
    profile = user |> profile_from_user

    case Auth.update_profile(profile, profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: user_profile_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", profile: profile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = conn |> user_from_session(:include_profile)
    profile = user |> profile_from_user

    {:ok, _profile} = Auth.delete_profile(profile)

    conn
    |> put_flash(:info, "Profile deleted successfully.")
    |> redirect(to: user_profile_path(conn, :index, user))
  end
end

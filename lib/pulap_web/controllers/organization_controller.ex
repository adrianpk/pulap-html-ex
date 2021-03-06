defmodule PulapWeb.OrganizationController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Organization
  require IEx

  def index(conn, _params) do
    organizations = Auth.list_organizations()
    render(conn, "index.html", organizations: organizations)
  end

  def new(conn, _params) do
    changeset = Auth.change_organization(%Organization{})
    render(conn, "new.html", changeset: changeset)
  end

  require IEx

  def create(conn, %{"organization" => organization_params}) do
    user = conn |> user_from_session
    updated_params = organization_params
                     |> Map.put("owner_id", user.id)
                     |> Map.put("owner_username", user.username)
    IEx.pry
    case Auth.create_organization(updated_params) do
      {:ok, organization} ->
        conn
        |> put_flash(:info, "Organization created successfully.")
        |> redirect(to: organization_path(conn, :show, organization))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organization = Auth.get_organization!(id)
    render(conn, "show.html", organization: organization)
  end

  def edit(conn, %{"id" => id}) do
    organization = Auth.get_organization!(id)
    changeset = Auth.change_organization(organization)
    render(conn, "edit.html", organization: organization, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organization" => organization_params}) do
    organization = Auth.get_organization!(id)

    case Auth.update_organization(organization, organization_params) do
      {:ok, organization} ->
        conn
        |> put_flash(:info, "Organization updated successfully.")
        |> redirect(to: organization_path(conn, :show, organization))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", organization: organization, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organization = Auth.get_organization!(id)
    {:ok, _organization} = Auth.delete_organization(organization)

    conn
    |> put_flash(:info, "Organization deleted successfully.")
    |> redirect(to: organization_path(conn, :index))
  end
end

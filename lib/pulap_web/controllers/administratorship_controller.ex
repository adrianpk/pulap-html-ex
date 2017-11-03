defmodule PulapWeb.AdministratorshipController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.Administratorship

  def index(conn, _params) do
    administratorships = Biz.list_administratorships()
    render(conn, "index.html", administratorships: administratorships)
  end

  def new(conn, _params) do
    changeset = Biz.change_administratorship(%Administratorship{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"administratorship" => administratorship_params}) do
    case Biz.create_administratorship(administratorship_params) do
      {:ok, administratorship} ->
        conn
        |> put_flash(:info, "Administratorship created successfully.")
        |> redirect(to: administratorship_path(conn, :show, administratorship))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    administratorship = Biz.get_administratorship!(id)
    render(conn, "show.html", administratorship: administratorship)
  end

  def edit(conn, %{"id" => id}) do
    administratorship = Biz.get_administratorship!(id)
    changeset = Biz.change_administratorship(administratorship)
    render(conn, "edit.html", administratorship: administratorship, changeset: changeset)
  end

  def update(conn, %{"id" => id, "administratorship" => administratorship_params}) do
    administratorship = Biz.get_administratorship!(id)

    case Biz.update_administratorship(administratorship, administratorship_params) do
      {:ok, administratorship} ->
        conn
        |> put_flash(:info, "Administratorship updated successfully.")
        |> redirect(to: administratorship_path(conn, :show, administratorship))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", administratorship: administratorship, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    administratorship = Biz.get_administratorship!(id)
    {:ok, _administratorship} = Biz.delete_administratorship(administratorship)

    conn
    |> put_flash(:info, "Administratorship deleted successfully.")
    |> redirect(to: administratorship_path(conn, :index))
  end
end

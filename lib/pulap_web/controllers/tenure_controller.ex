defmodule PulapWeb.TenureController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.Tenure

  def index(conn, _params) do
    tenures = Biz.list_tenures()
    render(conn, "index.html", tenures: tenures)
  end

  def new(conn, _params) do
    changeset = Biz.change_tenure(%Tenure{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tenure" => tenure_params}) do
    case Biz.create_tenure(tenure_params) do
      {:ok, tenure} ->
        conn
        |> put_flash(:info, "Tenure created successfully.")
        |> redirect(to: tenure_path(conn, :show, tenure))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tenure = Biz.get_tenure!(id)
    render(conn, "show.html", tenure: tenure)
  end

  def edit(conn, %{"id" => id}) do
    tenure = Biz.get_tenure!(id)
    changeset = Biz.change_tenure(tenure)
    render(conn, "edit.html", tenure: tenure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tenure" => tenure_params}) do
    tenure = Biz.get_tenure!(id)

    case Biz.update_tenure(tenure, tenure_params) do
      {:ok, tenure} ->
        conn
        |> put_flash(:info, "Tenure updated successfully.")
        |> redirect(to: tenure_path(conn, :show, tenure))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tenure: tenure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tenure = Biz.get_tenure!(id)
    {:ok, _tenure} = Biz.delete_tenure(tenure)

    conn
    |> put_flash(:info, "Tenure deleted successfully.")
    |> redirect(to: tenure_path(conn, :index))
  end
end

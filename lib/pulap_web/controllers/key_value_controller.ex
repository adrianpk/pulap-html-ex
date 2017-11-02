defmodule PulapWeb.KeyValueController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.App.KeyValue

  def index(conn, _params) do
    key_values = App.list_key_values()
    render(conn, "index.html", key_values: key_values)
  end

  def new(conn, _params) do
    changeset = App.change_key_value(%KeyValue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"key_value" => key_value_params}) do
    case App.create_key_value(key_value_params) do
      {:ok, key_value} ->
        conn
        |> put_flash(:info, "Key value created successfully.")
        |> redirect(to: key_value_path(conn, :show, key_value))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    key_value = App.get_key_value!(id)
    render(conn, "show.html", key_value: key_value)
  end

  def edit(conn, %{"id" => id}) do
    key_value = App.get_key_value!(id)
    changeset = App.change_key_value(key_value)
    render(conn, "edit.html", key_value: key_value, changeset: changeset)
  end

  def update(conn, %{"id" => id, "key_value" => key_value_params}) do
    key_value = App.get_key_value!(id)

    case App.update_key_value(key_value, key_value_params) do
      {:ok, key_value} ->
        conn
        |> put_flash(:info, "Key value updated successfully.")
        |> redirect(to: key_value_path(conn, :show, key_value))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", key_value: key_value, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    key_value = App.get_key_value!(id)
    {:ok, _key_value} = App.delete_key_value(key_value)

    conn
    |> put_flash(:info, "Key value deleted successfully.")
    |> redirect(to: key_value_path(conn, :index))
  end
end

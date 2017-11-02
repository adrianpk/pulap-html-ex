defmodule PulapWeb.CurrencyControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz

  @create_attrs %{code: "some code", icon: "some icon", is_active: true, is_logical_deleted: true, minor_unit: "some minor_unit", name: "some name", num_code: "some num_code"}
  @update_attrs %{code: "some updated code", icon: "some updated icon", is_active: false, is_logical_deleted: false, minor_unit: "some updated minor_unit", name: "some updated name", num_code: "some updated num_code"}
  @invalid_attrs %{code: nil, icon: nil, is_active: nil, is_logical_deleted: nil, minor_unit: nil, name: nil, num_code: nil}

  def fixture(:currency) do
    {:ok, currency} = Biz.create_currency(@create_attrs)
    currency
  end

  describe "index" do
    test "lists all currencies", %{conn: conn} do
      conn = get conn, currency_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Currencies"
    end
  end

  describe "new currency" do
    test "renders form", %{conn: conn} do
      conn = get conn, currency_path(conn, :new)
      assert html_response(conn, 200) =~ "New Currency"
    end
  end

  describe "create currency" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, currency_path(conn, :create), currency: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == currency_path(conn, :show, id)

      conn = get conn, currency_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Currency"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, currency_path(conn, :create), currency: @invalid_attrs
      assert html_response(conn, 200) =~ "New Currency"
    end
  end

  describe "edit currency" do
    setup [:create_currency]

    test "renders form for editing chosen currency", %{conn: conn, currency: currency} do
      conn = get conn, currency_path(conn, :edit, currency)
      assert html_response(conn, 200) =~ "Edit Currency"
    end
  end

  describe "update currency" do
    setup [:create_currency]

    test "redirects when data is valid", %{conn: conn, currency: currency} do
      conn = put conn, currency_path(conn, :update, currency), currency: @update_attrs
      assert redirected_to(conn) == currency_path(conn, :show, currency)

      conn = get conn, currency_path(conn, :show, currency)
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, currency: currency} do
      conn = put conn, currency_path(conn, :update, currency), currency: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Currency"
    end
  end

  describe "delete currency" do
    setup [:create_currency]

    test "deletes chosen currency", %{conn: conn, currency: currency} do
      conn = delete conn, currency_path(conn, :delete, currency)
      assert redirected_to(conn) == currency_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, currency_path(conn, :show, currency)
      end
    end
  end

  defp create_currency(_) do
    currency = fixture(:currency)
    {:ok, currency: currency}
  end
end

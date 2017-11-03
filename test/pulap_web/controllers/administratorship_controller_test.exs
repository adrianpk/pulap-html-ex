defmodule PulapWeb.AdministratorshipControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz

  @create_attrs %{ends_at: "2010-04-17 14:00:00.000000Z", is_active: true, is_logical_deleted: true, started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{ends_at: "2011-05-18 15:01:01.000000Z", is_active: false, is_logical_deleted: false, started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{ends_at: nil, is_active: nil, is_logical_deleted: nil, started_at: nil}

  def fixture(:administratorship) do
    {:ok, administratorship} = Biz.create_administratorship(@create_attrs)
    administratorship
  end

  describe "index" do
    test "lists all administratorships", %{conn: conn} do
      conn = get conn, administratorship_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Administratorships"
    end
  end

  describe "new administratorship" do
    test "renders form", %{conn: conn} do
      conn = get conn, administratorship_path(conn, :new)
      assert html_response(conn, 200) =~ "New Administratorship"
    end
  end

  describe "create administratorship" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, administratorship_path(conn, :create), administratorship: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == administratorship_path(conn, :show, id)

      conn = get conn, administratorship_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Administratorship"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, administratorship_path(conn, :create), administratorship: @invalid_attrs
      assert html_response(conn, 200) =~ "New Administratorship"
    end
  end

  describe "edit administratorship" do
    setup [:create_administratorship]

    test "renders form for editing chosen administratorship", %{conn: conn, administratorship: administratorship} do
      conn = get conn, administratorship_path(conn, :edit, administratorship)
      assert html_response(conn, 200) =~ "Edit Administratorship"
    end
  end

  describe "update administratorship" do
    setup [:create_administratorship]

    test "redirects when data is valid", %{conn: conn, administratorship: administratorship} do
      conn = put conn, administratorship_path(conn, :update, administratorship), administratorship: @update_attrs
      assert redirected_to(conn) == administratorship_path(conn, :show, administratorship)

      conn = get conn, administratorship_path(conn, :show, administratorship)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, administratorship: administratorship} do
      conn = put conn, administratorship_path(conn, :update, administratorship), administratorship: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Administratorship"
    end
  end

  describe "delete administratorship" do
    setup [:create_administratorship]

    test "deletes chosen administratorship", %{conn: conn, administratorship: administratorship} do
      conn = delete conn, administratorship_path(conn, :delete, administratorship)
      assert redirected_to(conn) == administratorship_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, administratorship_path(conn, :show, administratorship)
      end
    end
  end

  defp create_administratorship(_) do
    administratorship = fixture(:administratorship)
    {:ok, administratorship: administratorship}
  end
end

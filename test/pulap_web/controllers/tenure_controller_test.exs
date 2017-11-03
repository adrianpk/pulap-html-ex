defmodule PulapWeb.TenureControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz

  @create_attrs %{ends_at: "2010-04-17 14:00:00.000000Z", is_active: true, is_logical_deleted: true, job_description: "some job_description", job_title: "some job_title", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{ends_at: "2011-05-18 15:01:01.000000Z", is_active: false, is_logical_deleted: false, job_description: "some updated job_description", job_title: "some updated job_title", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{ends_at: nil, is_active: nil, is_logical_deleted: nil, job_description: nil, job_title: nil, started_at: nil}

  def fixture(:tenure) do
    {:ok, tenure} = Biz.create_tenure(@create_attrs)
    tenure
  end

  describe "index" do
    test "lists all tenures", %{conn: conn} do
      conn = get conn, tenure_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Tenures"
    end
  end

  describe "new tenure" do
    test "renders form", %{conn: conn} do
      conn = get conn, tenure_path(conn, :new)
      assert html_response(conn, 200) =~ "New Tenure"
    end
  end

  describe "create tenure" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, tenure_path(conn, :create), tenure: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == tenure_path(conn, :show, id)

      conn = get conn, tenure_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Tenure"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tenure_path(conn, :create), tenure: @invalid_attrs
      assert html_response(conn, 200) =~ "New Tenure"
    end
  end

  describe "edit tenure" do
    setup [:create_tenure]

    test "renders form for editing chosen tenure", %{conn: conn, tenure: tenure} do
      conn = get conn, tenure_path(conn, :edit, tenure)
      assert html_response(conn, 200) =~ "Edit Tenure"
    end
  end

  describe "update tenure" do
    setup [:create_tenure]

    test "redirects when data is valid", %{conn: conn, tenure: tenure} do
      conn = put conn, tenure_path(conn, :update, tenure), tenure: @update_attrs
      assert redirected_to(conn) == tenure_path(conn, :show, tenure)

      conn = get conn, tenure_path(conn, :show, tenure)
      assert html_response(conn, 200) =~ "some updated job_description"
    end

    test "renders errors when data is invalid", %{conn: conn, tenure: tenure} do
      conn = put conn, tenure_path(conn, :update, tenure), tenure: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Tenure"
    end
  end

  describe "delete tenure" do
    setup [:create_tenure]

    test "deletes chosen tenure", %{conn: conn, tenure: tenure} do
      conn = delete conn, tenure_path(conn, :delete, tenure)
      assert redirected_to(conn) == tenure_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, tenure_path(conn, :show, tenure)
      end
    end
  end

  defp create_tenure(_) do
    tenure = fixture(:tenure)
    {:ok, tenure: tenure}
  end
end

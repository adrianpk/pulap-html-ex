defmodule Pulap.AuthTest do
  use Pulap.DataCase

  alias Pulap.Auth

  describe "users" do
    alias Pulap.Auth.User

    @valid_attrs %{annotations: "some annotations", card: "some card", created_by: "7488a646-e31f-11e4-aace-600308960662", email: "some email", family_name: "some family_name", geolocation: 120.5, given_name: "some given_name", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, middle_names: "some middle_names", password: "some password", password_hash: "some password_hash", started_at: "2010-04-17 14:00:00.000000Z", username: "some username"}
    @update_attrs %{annotations: "some updated annotations", card: "some updated card", created_by: "7488a646-e31f-11e4-aace-600308960668", email: "some updated email", family_name: "some updated family_name", geolocation: 456.7, given_name: "some updated given_name", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, middle_names: "some updated middle_names", password: "some updated password", password_hash: "some updated password_hash", started_at: "2011-05-18 15:01:01.000000Z", username: "some updated username"}
    @invalid_attrs %{annotations: nil, card: nil, created_by: nil, email: nil, family_name: nil, geolocation: nil, given_name: nil, id: nil, is_active: nil, is_logical_deleted: nil, middle_names: nil, password: nil, password_hash: nil, started_at: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Auth.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Auth.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
      assert user.annotations == "some annotations"
      assert user.card == "some card"
      assert user.created_by == "7488a646-e31f-11e4-aace-600308960662"
      assert user.email == "some email"
      assert user.family_name == "some family_name"
      assert user.geolocation == 120.5
      assert user.given_name == "some given_name"
      assert user.id == "7488a646-e31f-11e4-aace-600308960662"
      assert user.is_active == true
      assert user.is_logical_deleted == true
      assert user.middle_names == "some middle_names"
      assert user.password == "some password"
      assert user.password_hash == "some password_hash"
      assert user.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Auth.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.annotations == "some updated annotations"
      assert user.card == "some updated card"
      assert user.created_by == "7488a646-e31f-11e4-aace-600308960668"
      assert user.email == "some updated email"
      assert user.family_name == "some updated family_name"
      assert user.geolocation == 456.7
      assert user.given_name == "some updated given_name"
      assert user.id == "7488a646-e31f-11e4-aace-600308960668"
      assert user.is_active == false
      assert user.is_logical_deleted == false
      assert user.middle_names == "some updated middle_names"
      assert user.password == "some updated password"
      assert user.password_hash == "some updated password_hash"
      assert user.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_user(user, @invalid_attrs)
      assert user == Auth.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end
end

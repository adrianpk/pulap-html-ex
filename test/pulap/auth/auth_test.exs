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

  describe "organizations" do
    alias Pulap.Auth.Organization

    @valid_attrs %{annotations: "some annotations", created_by: "7488a646-e31f-11e4-aace-600308960662", description: "some description", geolocation: 120.5, id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{annotations: "some updated annotations", created_by: "7488a646-e31f-11e4-aace-600308960668", description: "some updated description", geolocation: 456.7, id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{annotations: nil, created_by: nil, description: nil, geolocation: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def organization_fixture(attrs \\ %{}) do
      {:ok, organization} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_organization()

      organization
    end

    test "list_organizations/0 returns all organizations" do
      organization = organization_fixture()
      assert Auth.list_organizations() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture()
      assert Auth.get_organization!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      assert {:ok, %Organization{} = organization} = Auth.create_organization(@valid_attrs)
      assert organization.annotations == "some annotations"
      assert organization.created_by == "7488a646-e31f-11e4-aace-600308960662"
      assert organization.description == "some description"
      assert organization.geolocation == 120.5
      assert organization.id == "7488a646-e31f-11e4-aace-600308960662"
      assert organization.is_active == true
      assert organization.is_logical_deleted == true
      assert organization.name == "some name"
      assert organization.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture()
      assert {:ok, organization} = Auth.update_organization(organization, @update_attrs)
      assert %Organization{} = organization
      assert organization.annotations == "some updated annotations"
      assert organization.created_by == "7488a646-e31f-11e4-aace-600308960668"
      assert organization.description == "some updated description"
      assert organization.geolocation == 456.7
      assert organization.id == "7488a646-e31f-11e4-aace-600308960668"
      assert organization.is_active == false
      assert organization.is_logical_deleted == false
      assert organization.name == "some updated name"
      assert organization.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_organization(organization, @invalid_attrs)
      assert organization == Auth.get_organization!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{}} = Auth.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture()
      assert %Ecto.Changeset{} = Auth.change_organization(organization)
    end
  end

  describe "roles" do
    alias Pulap.Auth.Role

    @valid_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Auth.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Auth.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      assert {:ok, %Role{} = role} = Auth.create_role(@valid_attrs)
      assert role.description == "some description"
      assert role.id == "7488a646-e31f-11e4-aace-600308960662"
      assert role.is_active == true
      assert role.is_logical_deleted == true
      assert role.name == "some name"
      assert role.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      assert {:ok, role} = Auth.update_role(role, @update_attrs)
      assert %Role{} = role
      assert role.description == "some updated description"
      assert role.id == "7488a646-e31f-11e4-aace-600308960668"
      assert role.is_active == false
      assert role.is_logical_deleted == false
      assert role.name == "some updated name"
      assert role.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_role(role, @invalid_attrs)
      assert role == Auth.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Auth.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Auth.change_role(role)
    end
  end

  describe "permissions" do
    alias Pulap.Auth.Permission

    @valid_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organization_name: "some organization_name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organization_name: "some updated organization_name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organization_name: nil, started_at: nil}

    def permission_fixture(attrs \\ %{}) do
      {:ok, permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_permission()

      permission
    end

    test "list_permissions/0 returns all permissions" do
      permission = permission_fixture()
      assert Auth.list_permissions() == [permission]
    end

    test "get_permission!/1 returns the permission with given id" do
      permission = permission_fixture()
      assert Auth.get_permission!(permission.id) == permission
    end

    test "create_permission/1 with valid data creates a permission" do
      assert {:ok, %Permission{} = permission} = Auth.create_permission(@valid_attrs)
      assert permission.description == "some description"
      assert permission.id == "7488a646-e31f-11e4-aace-600308960662"
      assert permission.is_active == true
      assert permission.is_logical_deleted == true
      assert permission.name == "some name"
      assert permission.organization_name == "some organization_name"
      assert permission.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_permission(@invalid_attrs)
    end

    test "update_permission/2 with valid data updates the permission" do
      permission = permission_fixture()
      assert {:ok, permission} = Auth.update_permission(permission, @update_attrs)
      assert %Permission{} = permission
      assert permission.description == "some updated description"
      assert permission.id == "7488a646-e31f-11e4-aace-600308960668"
      assert permission.is_active == false
      assert permission.is_logical_deleted == false
      assert permission.name == "some updated name"
      assert permission.organization_name == "some updated organization_name"
      assert permission.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_permission/2 with invalid data returns error changeset" do
      permission = permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_permission(permission, @invalid_attrs)
      assert permission == Auth.get_permission!(permission.id)
    end

    test "delete_permission/1 deletes the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{}} = Auth.delete_permission(permission)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_permission!(permission.id) end
    end

    test "change_permission/1 returns a permission changeset" do
      permission = permission_fixture()
      assert %Ecto.Changeset{} = Auth.change_permission(permission)
    end
  end

  describe "resources" do
    alias Pulap.Auth.Resource

    @valid_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organization_name: "some organization_name", started_at: "2010-04-17 14:00:00.000000Z", tag: "some tag"}
    @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organization_name: "some updated organization_name", started_at: "2011-05-18 15:01:01.000000Z", tag: "some updated tag"}
    @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organization_name: nil, started_at: nil, tag: nil}

    def resource_fixture(attrs \\ %{}) do
      {:ok, resource} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_resource()

      resource
    end

    test "list_resources/0 returns all resources" do
      resource = resource_fixture()
      assert Auth.list_resources() == [resource]
    end

    test "get_resource!/1 returns the resource with given id" do
      resource = resource_fixture()
      assert Auth.get_resource!(resource.id) == resource
    end

    test "create_resource/1 with valid data creates a resource" do
      assert {:ok, %Resource{} = resource} = Auth.create_resource(@valid_attrs)
      assert resource.description == "some description"
      assert resource.id == "7488a646-e31f-11e4-aace-600308960662"
      assert resource.is_active == true
      assert resource.is_logical_deleted == true
      assert resource.name == "some name"
      assert resource.organization_name == "some organization_name"
      assert resource.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert resource.tag == "some tag"
    end

    test "create_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_resource(@invalid_attrs)
    end

    test "update_resource/2 with valid data updates the resource" do
      resource = resource_fixture()
      assert {:ok, resource} = Auth.update_resource(resource, @update_attrs)
      assert %Resource{} = resource
      assert resource.description == "some updated description"
      assert resource.id == "7488a646-e31f-11e4-aace-600308960668"
      assert resource.is_active == false
      assert resource.is_logical_deleted == false
      assert resource.name == "some updated name"
      assert resource.organization_name == "some updated organization_name"
      assert resource.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert resource.tag == "some updated tag"
    end

    test "update_resource/2 with invalid data returns error changeset" do
      resource = resource_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_resource(resource, @invalid_attrs)
      assert resource == Auth.get_resource!(resource.id)
    end

    test "delete_resource/1 deletes the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{}} = Auth.delete_resource(resource)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_resource!(resource.id) end
    end

    test "change_resource/1 returns a resource changeset" do
      resource = resource_fixture()
      assert %Ecto.Changeset{} = Auth.change_resource(resource)
    end
  end

  describe "role_permissions" do
    alias Pulap.Auth.RolePermission

    @valid_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def role_permission_fixture(attrs \\ %{}) do
      {:ok, role_permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_role_permission()

      role_permission
    end

    test "list_role_permissions/0 returns all role_permissions" do
      role_permission = role_permission_fixture()
      assert Auth.list_role_permissions() == [role_permission]
    end

    test "get_role_permission!/1 returns the role_permission with given id" do
      role_permission = role_permission_fixture()
      assert Auth.get_role_permission!(role_permission.id) == role_permission
    end

    test "create_role_permission/1 with valid data creates a role_permission" do
      assert {:ok, %RolePermission{} = role_permission} = Auth.create_role_permission(@valid_attrs)
      assert role_permission.description == "some description"
      assert role_permission.id == "7488a646-e31f-11e4-aace-600308960662"
      assert role_permission.is_active == true
      assert role_permission.is_logical_deleted == true
      assert role_permission.name == "some name"
      assert role_permission.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_role_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_role_permission(@invalid_attrs)
    end

    test "update_role_permission/2 with valid data updates the role_permission" do
      role_permission = role_permission_fixture()
      assert {:ok, role_permission} = Auth.update_role_permission(role_permission, @update_attrs)
      assert %RolePermission{} = role_permission
      assert role_permission.description == "some updated description"
      assert role_permission.id == "7488a646-e31f-11e4-aace-600308960668"
      assert role_permission.is_active == false
      assert role_permission.is_logical_deleted == false
      assert role_permission.name == "some updated name"
      assert role_permission.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_role_permission/2 with invalid data returns error changeset" do
      role_permission = role_permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_role_permission(role_permission, @invalid_attrs)
      assert role_permission == Auth.get_role_permission!(role_permission.id)
    end

    test "delete_role_permission/1 deletes the role_permission" do
      role_permission = role_permission_fixture()
      assert {:ok, %RolePermission{}} = Auth.delete_role_permission(role_permission)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_role_permission!(role_permission.id) end
    end

    test "change_role_permission/1 returns a role_permission changeset" do
      role_permission = role_permission_fixture()
      assert %Ecto.Changeset{} = Auth.change_role_permission(role_permission)
    end
  end

  describe "resource_permissions" do
    alias Pulap.Auth.ResourcePermission

    @valid_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def resource_permission_fixture(attrs \\ %{}) do
      {:ok, resource_permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_resource_permission()

      resource_permission
    end

    test "list_resource_permissions/0 returns all resource_permissions" do
      resource_permission = resource_permission_fixture()
      assert Auth.list_resource_permissions() == [resource_permission]
    end

    test "get_resource_permission!/1 returns the resource_permission with given id" do
      resource_permission = resource_permission_fixture()
      assert Auth.get_resource_permission!(resource_permission.id) == resource_permission
    end

    test "create_resource_permission/1 with valid data creates a resource_permission" do
      assert {:ok, %ResourcePermission{} = resource_permission} = Auth.create_resource_permission(@valid_attrs)
      assert resource_permission.description == "some description"
      assert resource_permission.id == "7488a646-e31f-11e4-aace-600308960662"
      assert resource_permission.is_active == true
      assert resource_permission.is_logical_deleted == true
      assert resource_permission.name == "some name"
      assert resource_permission.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_resource_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_resource_permission(@invalid_attrs)
    end

    test "update_resource_permission/2 with valid data updates the resource_permission" do
      resource_permission = resource_permission_fixture()
      assert {:ok, resource_permission} = Auth.update_resource_permission(resource_permission, @update_attrs)
      assert %ResourcePermission{} = resource_permission
      assert resource_permission.description == "some updated description"
      assert resource_permission.id == "7488a646-e31f-11e4-aace-600308960668"
      assert resource_permission.is_active == false
      assert resource_permission.is_logical_deleted == false
      assert resource_permission.name == "some updated name"
      assert resource_permission.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_resource_permission/2 with invalid data returns error changeset" do
      resource_permission = resource_permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_resource_permission(resource_permission, @invalid_attrs)
      assert resource_permission == Auth.get_resource_permission!(resource_permission.id)
    end

    test "delete_resource_permission/1 deletes the resource_permission" do
      resource_permission = resource_permission_fixture()
      assert {:ok, %ResourcePermission{}} = Auth.delete_resource_permission(resource_permission)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_resource_permission!(resource_permission.id) end
    end

    test "change_resource_permission/1 returns a resource_permission changeset" do
      resource_permission = resource_permission_fixture()
      assert %Ecto.Changeset{} = Auth.change_resource_permission(resource_permission)
    end
  end

  describe "profiles" do
    alias Pulap.Auth.Profile

    @valid_attrs %{anniversary_date: "2010-04-17 14:00:00.000000Z", annotations: "some annotations", avatar: "some avatar", avatar_path: "some avatar_path", bio: "some bio", cards: "some cards", description: "some description", email: "some email", geolocation: 120.5, header: "some header", header_path: "some header_path", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, moto: "some moto", name: "some name", started_at: "2010-04-17 14:00:00.000000Z", website: "some website"}
    @update_attrs %{anniversary_date: "2011-05-18 15:01:01.000000Z", annotations: "some updated annotations", avatar: "some updated avatar", avatar_path: "some updated avatar_path", bio: "some updated bio", cards: "some updated cards", description: "some updated description", email: "some updated email", geolocation: 456.7, header: "some updated header", header_path: "some updated header_path", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, moto: "some updated moto", name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z", website: "some updated website"}
    @invalid_attrs %{anniversary_date: nil, annotations: nil, avatar: nil, avatar_path: nil, bio: nil, cards: nil, description: nil, email: nil, geolocation: nil, header: nil, header_path: nil, id: nil, is_active: nil, is_logical_deleted: nil, moto: nil, name: nil, started_at: nil, website: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Auth.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Auth.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Auth.create_profile(@valid_attrs)
      assert profile.anniversary_date == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert profile.annotations == "some annotations"
      assert profile.avatar == "some avatar"
      assert profile.avatar_path == "some avatar_path"
      assert profile.bio == "some bio"
      assert profile.cards == "some cards"
      assert profile.description == "some description"
      assert profile.email == "some email"
      assert profile.geolocation == 120.5
      assert profile.header == "some header"
      assert profile.header_path == "some header_path"
      assert profile.id == "7488a646-e31f-11e4-aace-600308960662"
      assert profile.is_active == true
      assert profile.is_logical_deleted == true
      assert profile.moto == "some moto"
      assert profile.name == "some name"
      assert profile.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert profile.website == "some website"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, profile} = Auth.update_profile(profile, @update_attrs)
      assert %Profile{} = profile
      assert profile.anniversary_date == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert profile.annotations == "some updated annotations"
      assert profile.avatar == "some updated avatar"
      assert profile.avatar_path == "some updated avatar_path"
      assert profile.bio == "some updated bio"
      assert profile.cards == "some updated cards"
      assert profile.description == "some updated description"
      assert profile.email == "some updated email"
      assert profile.geolocation == 456.7
      assert profile.header == "some updated header"
      assert profile.header_path == "some updated header_path"
      assert profile.id == "7488a646-e31f-11e4-aace-600308960668"
      assert profile.is_active == false
      assert profile.is_logical_deleted == false
      assert profile.moto == "some updated moto"
      assert profile.name == "some updated name"
      assert profile.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert profile.website == "some updated website"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_profile(profile, @invalid_attrs)
      assert profile == Auth.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Auth.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Auth.change_profile(profile)
    end
  end
end

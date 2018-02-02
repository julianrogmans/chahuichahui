defmodule PhoenixElmStarter.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :encrypted_password, :string
      add :last_sign_in, :naive_datetime

      timestamps()
    end

  end
end

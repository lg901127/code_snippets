class ChangeUsersColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :pass_digest, :password_digest
  end
end

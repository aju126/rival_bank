class UserRoles < ActiveRecord::Migration
  def change
    create_join_table :user_accounts, :roles, table_name: :users_roles do |t|
      t.index [:user_account_id, :role_id]
      t.index :role_id
    end
  end
end

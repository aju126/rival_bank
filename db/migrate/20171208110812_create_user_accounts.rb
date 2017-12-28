class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.integer :account_number, limit:8
      t.string :user_name
      t.belongs_to :user_information
      t.belongs_to :account_interest
      t.belongs_to :account_balance
      t.timestamps null: false
    end
  end
end

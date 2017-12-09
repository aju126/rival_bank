class CreateAccountBalances < ActiveRecord::Migration
  def change
    create_table :account_balances do |t|
      t.decimal :balance

      t.timestamps null: false
    end
  end
end

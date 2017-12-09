class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :user_account
      t.belongs_to :user_account
      t.belongs_to :action
      t.timestamps null: false
    end
  end
end

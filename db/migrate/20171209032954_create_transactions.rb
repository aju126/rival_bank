class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :source_user_account_id, index: true
      t.references :destination_user_account_id, index: true
      t.belongs_to :action
      t.decimal :amount
      t.timestamps null: false
    end
  end
end

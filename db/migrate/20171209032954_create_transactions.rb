class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :source_user_account, index: true
      t.references :destination_user_account, index: true
      t.belongs_to :action
      t.decimal :amount
      t.timestamps null: false
    end
  end
end

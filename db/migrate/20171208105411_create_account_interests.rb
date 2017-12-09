class CreateAccountInterests < ActiveRecord::Migration
  def change
    create_table :account_interests do |t|
      t.decimal :interest
      t.string :account_name
      t.timestamps null: false
    end
  end
end

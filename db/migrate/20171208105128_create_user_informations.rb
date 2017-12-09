class CreateUserInformations < ActiveRecord::Migration
  def change
    create_table :user_informations do |t|
      t.string :name, null:false
      t.string :phone, null: false
      t.text :address
      t.string :email
      t.timestamps null: false
    end
  end
end

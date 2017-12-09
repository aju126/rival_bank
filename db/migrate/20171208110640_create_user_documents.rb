class CreateUserDocuments < ActiveRecord::Migration
  def change
    create_table :user_documents do |t|
      t.string :value
      t.belongs_to :user_information, index: true
      t.belongs_to :document, index: true
      t.timestamps null: false
    end
  end
end

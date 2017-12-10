class Document < ActiveRecord::Base

  # Associations

  has_many :user_documents
  has_many :user_informations, through: :user_documents
end

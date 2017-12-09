class Document < ActiveRecord::Base

  # Associations

  has_many :user_document
  has_many :user_information, through: :user_document
end

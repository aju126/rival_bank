class UserInformation < ActiveRecord::Base
  has_many :user_accounts
  has_many :user_documents
  has_many :documents, through: :user_documents
  accepts_nested_attributes_for :user_accounts
  accepts_nested_attributes_for :user_documents
end

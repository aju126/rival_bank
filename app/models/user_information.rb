class UserInformation < ActiveRecord::Base
  has_many :user_accounts
  has_many :user_documents
  has_many :documents, through: :user_documents
end

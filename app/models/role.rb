class Role < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :user_accounts, join_table: 'users_roles'

  ROLE_ADMIN = 'Administrator'
  ROLE_MANAGER = 'Manager'
  ROLE_STAFF = 'Staff'
  ROLE_ACCOUNT_HOLDER = 'AccountHolder'
end

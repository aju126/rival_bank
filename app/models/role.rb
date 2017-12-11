class Role < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :user_accounts, join_table: 'users_roles'

  ROLE_ADMIN = 'Administrator'
  ROLE_MANAGER = 'Manager'
  ROLE_STAFF = 'Staff'
  ROLE_ACCOUNT_HOLDER = 'AccountHolder'

  default_scope { order(:name) }
  scope :admin, -> {find_by(name: ROLE_ADMIN)}
  scope :manager, -> {find_by(name:  ROLE_MANAGER)}
  scope :account_holder, -> {find_by(name:  ROLE_ACCOUNT_HOLDER)}
end

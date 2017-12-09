class AccountBalance < ActiveRecord::Base
  has_one :user_account
end

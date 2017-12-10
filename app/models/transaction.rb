class Transaction < ActiveRecord::Base
  belongs_to :source_user_account, class_name: 'UserAccount', foreign_key: 'source_user_account_id'
  belongs_to :destination_user_account, class_name: 'UserAccount', foreign_key: 'destination_user_account_id'
  belongs_to :action

end

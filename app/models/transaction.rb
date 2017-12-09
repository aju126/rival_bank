class Transaction < ActiveRecord::Base
  belongs_to :account_name, class_name: 'source account'
  belongs_to :account_name, class_name: 'destination account'
  belongs_to :action
end

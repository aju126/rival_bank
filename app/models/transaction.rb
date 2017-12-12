class Transaction < ActiveRecord::Base
  belongs_to :source_user_account, class_name: 'UserAccount', foreign_key: 'source_user_account_id'
  belongs_to :destination_user_account, class_name: 'UserAccount', foreign_key: 'destination_user_account_id'
  belongs_to :action

  scope :mine, ->(current_user_account) { where("source_user_account_id= ? OR destination_user_account_id= ?", current_user_account, current_user_account )}

  # def action
  #   self.action.name
  # end

  def destination_account
    self.action.name == 'Credit' ? self.destination_user_account.user_name : self.source_user_account.user_name
  rescue
    nil
  end
end

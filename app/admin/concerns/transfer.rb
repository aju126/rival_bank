module Transfer
  extend ActiveSupport::Concern

  def valid_balance?(account, amount)
    return true if account.balance.to_i - amount.to_i > 0
    return false
  end

  def account_exists?(account)
    return true if UserAccount.find_by_account_number(account)
    return false
  end
end
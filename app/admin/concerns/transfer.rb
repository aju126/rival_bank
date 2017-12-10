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

  def transfer_balance(source, destination=nil, amount)

    if valid_balance?(source, amount)
      if destination.present?
        source.update_balance(amount.to_i, :debit)
        destination.update_balance(amount.to_i, :credit)
      else
        source.update_balance(amount.to_i, :credit)
      end
      transact = Transaction.new(
          amount: amount.to_i,
          action_id: Action.find_by_name('credit').id
      )
      transact.source_user_account_id = source.id
      transact.destination_user_account_id = destination.id if destination.present?
      transact.save!
    end
  end

  def account(acc)
    account = UserAccount.find_by_account_number(acc)
    raise account
    account
  end

  def not_activated(exception)
    flash[:notice] = "This user is not activated."
    Event.new_event "Exception: #{exception.message}", current_user, request.remote_ip
    redirect_to "/"
  end
end
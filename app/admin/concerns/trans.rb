module Trans
  extend ActiveSupport::Concern

  def valid_balance?(account, amount)
    return true if account.balance.to_i - amount.to_i > 0
    return false
  end

  def account_exists?(account)
    return true if UserAccount.find_by_account_number(account)
    return false
  end

  def transfer_bal(source, destination=nil, amount)
    UserAccount.transaction do
      UserAccount.after_rollback { return false }
      begin
        destination_account = account(destination)
        if valid_balance?(source, amount)
          if destination_account.present?
            source.update_balance(amount.to_i, :debit)
            destination_account.update_balance(amount.to_i, :credit)
          else
            source.update_balance(amount.to_i, :credit)
          end
          transact = Transaction.new(amount: amount.to_i)
          transact.action = Action.find_by_name('credit')
          transact.source_user_account_id = source.id
          transact.destination_user_account_id = destination_account.id if destination_account.present?
          transact.save!
          return true
        end
      rescue => e
        Rails.logger.error "An exception occurred while transferring: #{e.message}"
        flash[:error] = e.message
        raise ActiveRecord::Rollback
      end
    end
  end

  def account(acc)
    account = UserAccount.find_by_account_number(acc)
    raise 'Destination Account not found!' if account.nil?
    account
  end

  def not_activated(exception)
    flash[:notice] = "This user is not activated."
    Event.new_event "Exception: #{exception.message}", current_user, request.remote_ip
    redirect_to "/"
  end
end
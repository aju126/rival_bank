
ActiveAdmin.register_page 'Transfer Credit' do

  menu parent: 'Operations'
  content do
    panel '' do
      render 'credit'
    end
  end

  controller do
    def credit
      destination_account = account(params[:destination_user_account_name])
      amount = params[:amount]
      p "destination amount is #{destination_account} and #{amount}"
      if destination_account.present? && amount.present?
        UserAccount.transaction do
          destination_account.update_balance(amount.to_i, :credit)
          transact = Transaction.new(
            amount: amount.to_i,
            action_id: Action.find_by_name('Credit').id
          )
          transact.source_user_account_id = current_user_account.id
          transact.destination_user_account_id = destination_account.id
          transact.save!
        end
      end
      redirect_to '/admin'
    end

    def account(acc)
      account = UserAccount.find_by_account_number(acc)
      #raise 'Destination Account not found!' if account.nil?
      account
    end
  end
end
ActiveAdmin.register_page 'Transfer Balance' do

  menu parent: 'Operations'
  content do
    panel '' do
      render 'transfer'
    end
  end

  controller do
    include Transfer

    def transfer
      UserAccount.transaction do
        amount = params[:amount]
        destination_account = account(params[:destination_user_account_name])
        transfer_balance(current_user_account, destination_account, amount)
        return redirect_to '/admin'
      end
      render :transfer
    end
  end
end
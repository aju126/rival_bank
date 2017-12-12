
ActiveAdmin.register_page 'Transfer Balance' do

  menu parent: 'Operations'

  content do
    panel '' do
      render 'transfer_balance'
    end
  end

  controller do
    include Trans

    def transfer_balance
      raise self.inspect
    end

    def transfer
      amount = params[:amount]
      destination_account = params[:destination_user_account_name]
      # value = transfer_bal(current_user_account, destination_account, amount)
      # return redirect_to '/admin' if value == true
      # @error = flash[:error]
      return redirect_to '/admin/transfer_balance'#, alert: flash[:error]
    end
  end
end
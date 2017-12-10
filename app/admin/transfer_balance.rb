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
      valid_balance?(current_user_account, params[:amount])
      raise account_exists?(params[:destination_user_account_name]).inspect
    end
  end
end
class UserAccountsController < InheritedResources::Base

  private

    def user_account_params
      params.require(:user_account).permit(:account_number, :user_name)
    end
end


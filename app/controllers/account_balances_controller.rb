class AccountBalancesController < InheritedResources::Base

  private

    def account_balance_params
      params.require(:account_balance).permit(:balance)
    end
end


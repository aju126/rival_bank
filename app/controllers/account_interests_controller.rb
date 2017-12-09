class AccountInterestsController < InheritedResources::Base

  private

    def account_interest_params
      params.require(:account_interest).permit(:interest, :account_name)
    end
end


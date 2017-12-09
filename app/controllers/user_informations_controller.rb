class UserInformationsController < InheritedResources::Base

  private

    def user_information_params
      params.require(:user_information).permit(:name, :phone, :address, :email)
    end
end


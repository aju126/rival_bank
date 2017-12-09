class UserDocumentsController < InheritedResources::Base

  private

    def user_document_params
      params.require(:user_document).permit()
    end
end


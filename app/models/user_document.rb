class UserDocument < ActiveRecord::Base
  belongs_to :document
  belongs_to :user_information
end

ActiveAdmin.register UserAccount do
  menu if: proc { current_user_account.admin? }

  config.per_page = 100

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :user_name, :account_number, :password, :password_confirmation,
                user_information_attributes: [:name, :phone, :address, :email, :account_interest_id, :role_ids]

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs 'Add new Account' do
      input :account_number
      input :user_name
      if f.object.new_record?
        input :password
        input :password_confirmation
      end
      input :account_interest, label: 'Account Type', collection: AccountInterest.all.map{ |account| [account.account_name, account.id]}
      input :roles
    end

    f.inputs 'Add User Information', for: [:user_information, f.object.user_information || UserInformation.new] do |u|
      u.input :name
      u.input :phone
      u.input :address
      u.input :email

      u.has_many :user_documents do |doc|
        doc.inputs 'User Documents' do
          doc.input :document
          doc.input :value
        end
      end
    end
    f.actions
  end

  index  do
    selectable_column
    column :account_number
    column :user_name
    column :name do |info|
      info.user_information.name
    end
    column :phone do |info|
      info.user_information.phone
    end
    column :email do |info|
      info.user_information.email
    end
    column :balance do |balance|
      balance.account_balance.try(:balance).presence || '0'
    end
    actions
  end

  show do
    attributes_table do
      row :account_number
      row :user_name
      row :name do |info|
        info.user_information.name
      end
      row :phone do |info|
        info.user_information.phone
      end
      row :email do |info|
        info.user_information.email
      end
      row :address do |info|
        info.user_information.address
      end
      row :account_type do |account|
        account.account_interest.try(:name).presence || 'Not Available'
      end
      row :balance do |balance|
        balance.account_balance.try(:balance).presence || '0'
      end
      row :created_at
      row :updated_at
    end
  end

  controller do


    def scoped_collection
      UserAccount.includes(:user_information).includes(:account_balance)
    end

  end

end

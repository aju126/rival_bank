ActiveAdmin.register AccountInterest do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :account_name, :interest
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
    f.inputs 'Accounts Interest Rate' do
      input :account_name
      input :interest
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :account_name
    column :interest
    actions
  end

  show do
    attributes_table do
      row :account_name
      row :interest
      row :created_at
      row :updated_at
    end
  end
end

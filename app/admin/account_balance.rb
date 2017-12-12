ActiveAdmin.register AccountBalance do
  menu if: proc { current_user_account.admin? }
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

# index title: 'Account ' do
#   column t('features.toggle_name'), sortable: :name, class: 'word-wrap' do |feature|
#     if bandu_user.can? :update, feature
#       link_to feature.name, edit_admin_feature_path(feature)
#     else
#       link_to feature.name, admin_feature_path(feature)
#     end
#   end
#   column t('features.toggle_key'), :key, class: 'word-wrap'
#   column t('features.package_required'), :package_req
#   column t('features.build_required'), :build_req
#   column 'Created Date', sortable: :created_at do |obj|
#     obj.created_at.strftime('%Y-%m-%d')
#   end
#   column 'Delete', :delete do |feature|
#     link_to('Delete', admin_feature_path(feature.id),
#             method: :delete,
#             data: {confirm: t('features.delete_confirmation')}) if bandu_user.can?(:destroy, feature)
#   end
# end


end

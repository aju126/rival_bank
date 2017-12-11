Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :user_accounts
  root to: redirect('/admin/user_accounts')
  get 'admin/transfer_balance', to: 'admin/transfer_balance#transfer_balance'
  post 'admin/transfer_balance', to: 'admin/transfer_balance#transfer'
  post 'admin/transfer_credit', to: 'admin/transfer_credit#credit'
  post 'admin/interest_calculator', to: 'admin/interest_calculator#calculate'
  # resources :roles
  # resources :transactions
  # resources :account_balances
  # resources :actions
  # resources :user_accounts
  # resources :user_documents
  # resources :documents
  # resources :account_interests
  # resources :user_informations
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

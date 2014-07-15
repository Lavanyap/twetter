Twetter::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  authenticated :user do
    resources :follows, :except => [:new, :edit, :show, :update]
    resources :twets, :except => [:new, :edit, :show, :update]
    resources :users, :except => [:new, :edit, :update]
    #resources :users;
    #get ':username', to: 'users#show'

    #match ":username/edit", :to => "users#edit", :as => "edit_user", :via => :get
   # match ":username", :to => "users#show", :as => "user", :via => :get
    #match ":username", :to => "users#update", :as => "user", :via => :put
    #match ":username", :to => "users#destroy", :as => "user", :via => :delete
    root :to => 'follows#index', :as => :user_root
  end

  # You can have the root of your site routed with "root"
  root :to => 'home#index'

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

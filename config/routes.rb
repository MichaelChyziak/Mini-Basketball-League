Rails.application.routes.draw do
  get 'sessions/new' , to: 'sessions#new'

  get 'users/new'
  get '/home' , to: 'welcome#home'
  get '/profile', to: 'welcome#profile'
  get '/about' , to: 'welcome#about'
  get 'teams/join', to:'teams#join'



  resources :teams
  resources :users
  resources :sessions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  # Used to approve or decline a team into a league
  resources :teams do
    member do
      get "approve"
      put "approve"
      get "decline"
      put "decline"
      get "join_team"
      put "join_team"
    end
  end
  match "teams/:id/approve" => "teams#approve", via: [:get, :post]
  match "teams/:id/decline" => "teams#decline", via: [:get, :post]
  match "teams/:id/join_team" => "teams#join_team", via: [:get, :post]


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

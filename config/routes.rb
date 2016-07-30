Rails.application.routes.draw do
  get 'maps/new'

  get 'show', to: 'maps#show'
  get 'maps', to: 'maps#index'

  get 'sessions/new' , to: 'sessions#new'

  get 'users/new'
  get '/home' , to: 'welcome#home'
  get '/profile', to: 'welcome#profile'
  get '/about' , to: 'welcome#about'
  get 'teams/join', to:'teams#join'
  get '/schedule' , to: 'welcome#schedule'
  get '/schedule2' , to: 'welcome#schedule2'
  get '/schedule3' , to: 'welcome#schedule3'
  get '/standings', to: 'welcome#standings'

  get 'signup'  => 'users#new'

  get '/league/start', to: 'league#start'
  get '/league/back', to: 'league#back'
  get '/score/form', to: 'score#form'
  patch '/score/submit', to: 'score#submit'
  get '/scores', to: 'score#index'
  patch '/score/confirm', to: 'score#confirm'

  # Login
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :teams
  resources :users
  resources :sessions
  resources :maps
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'sessions#new'

  # Used to approve or decline a team into a league
  resources :teams do
    member do
      get "approve"
      put "approve"
      get "decline"
      put "decline"
      get "join_team"
      put "join_team"
      get "leave_team"
      put "leave_team"
      get "captain_team"
      put "captain_team"
      get "accept_user"
      put "accept_user"
      get "decline_user"
      put "decline_user"
      get "appoint_captain"
      put "appoint_captain"
      get "remove_user"
      put "remove_user"
    end
  end
  match "teams/:id/approve" => "teams#approve", via: [:get, :post]
  match "teams/:id/decline" => "teams#decline", via: [:get, :post]
  match "teams/:id/join_team" => "teams#join_team", via: [:get, :post]
  match "teams/:id/leave_team" => "teams#leave_team", via: [:get, :post]
  match 'teams/:id/manage_team' => 'teams#captain_team', via: [:get, :post]
  match "teams/:id/accept_user" => "teams#accept_user", via: [:get, :post]
  match 'teams/:id/decline_user' => 'teams#decline_user', via: [:get, :post]
  match "teams/:id/appoint_captain" => "teams#appoint_captain", via: [:get, :post]
  match 'teams/:id/remove_user' => 'teams#remove_user', via: [:get, :post]


  # Used for admins to edit users admin status
  resources :users do
    member do
      get "enable_admin"
      put "enable_admin"
      get "disable_admin"
      put "disable_admin"
    end
  end
  match "users/:id/enable_admin" => "teams#enable_admin", via: [:get, :post]
  match "users/:id/disable_admin" => "teams#disable_admin", via: [:get, :post]

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

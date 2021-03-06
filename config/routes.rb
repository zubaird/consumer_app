ConsumerApp::Application.routes.draw do

  root :to => "static_pages#home"

  # concern :followable do
  #     get 'followthis'
  # end

  resources :accounts 
  resources :mailboxes


  resources :employers do
    resources :mailboxes
    resources :job_postings
    member do 
      get :followme
    end
  end  

  #, concerns: :followable
  resources :sponsors do 
  resources :mailboxes
    member do 
      get :followme
      get :jobsearch
      post :jobsearch
    end
  end  

  resources :candidates #, only: [:new, :create, :delete]

  resources :job_postings


  #resources :things_admins, :controller=>"users", :except=>[:new, :create]
  

  
  resources :sessions, only: [:new, :create, :destroy]


  get "static_pages/help"
  match "/signin", to: "sessions#new", via: "get"
  match "/signout", to: "sessions#destroy", via: "delete"
  match "/signup", to: "accounts#new", via: "get"



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

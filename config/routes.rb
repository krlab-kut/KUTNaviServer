Rails.application.routes.draw do
  root 'indexes#index'

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  resource :admin, controller: 'admin/indexes', only: [ :index ] do
    resource :information, controller: 'admin/information', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resource :events, controller: 'admin/events', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resource :questions, controller: 'admin/questions', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resource :answers, controller: 'admin/answers', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
  end

  # /user.json
  get    '/user'              => 'users#index'
  post   '/user'              => 'users#update'
  post    '/user/create'      => 'users#create'
  # /information.json
  get    '/information' => 'information#index'
  # /events.json
  get    '/events'  => 'events#index'
  # /questions.json
  get    '/questions'   => 'questions#index'
  post   '/questions'   => 'questions#create'
  delete '/questions'   => 'questions#delete'
  # /answers.json
  get    '/answers'   => 'answers#index'
  post   '/answers'   => 'answers#create'
  delete '/answers'   => 'answers#delete'
  # /naruko.json
  post   '/naruko' => 'narukos#create'

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

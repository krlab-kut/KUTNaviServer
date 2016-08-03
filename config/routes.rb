Rails.application.routes.draw do
#Server Side
  root 'indexes#index'

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  resources :admin, controller: 'admin/indexes', only: [ :index ] do
    resources :answers, controller: 'admin/answers', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resources :events, controller: 'admin/events', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resources :favorites, controller: 'admin/favorites', only: [ :index, :show ]
    resources :information, controller: 'admin/information', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resources :labs, controller: 'admin/labs', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resources :places, controller: 'admin/places', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
    resources :questions, controller: 'admin/questions', only: [ :index, :create, :new, :edit, :show, :update, :destroy ]
  end

#Client Side
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
  # /favorites.json
  post   '/favorites' => 'favorites#create'
  delete '/favorites' => 'favorites#delete'
end

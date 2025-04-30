Rails.application.routes.draw do
  # Root route
  root 'home#index'

  # OmniAuth routes
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  # Logout route
  get '/logout', to: 'sessions#destroy'

  # create type of user route
  get 'select_role', to: 'sessions#select_role'
  post 'select_role', to: 'sessions#select_role'

  post '/update_role', to: 'sessions#update_role'

  resources :questions, only: [:index, :create, :update, :destroy, :show, :edit] do
    resources :comments, only: [:index, :create, :update, :destroy, :show, :edit]
  end
  
  # students routes - added destroy and admin update action
  resources :students, only: [:show, :edit, :update, :index, :destroy] do
    member do
      patch 'admin_update'
    end
  end

  resources :users, only: [:show, :edit, :update, :index]

  resources :mentors, only: [:index, :show, :edit, :update] do
    collection do
      get 'search'
      get 'specialties'
    end
  end

  #make path for new specialty
  get 'admin/specialties/new', to: 'admin#new_specialty', as: 'new_specialty'
  post 'admin/specialties', to: 'admin#create_specialty', as: 'create_specialty'
  get 'admin/specialties/:id/edit', to: 'admin#edit_specialty', as: 'edit_specialty'
  patch 'admin/specialties/:id', to: 'admin#update_specialty', as: 'update_specialty'
  delete 'admin/specialties/:id', to: 'admin#destroy_specialty', as: 'destroy_specialty'
  get 'admin/specialties', to: 'admin#specialties', as: 'specialties'

  resources :specialties, only: [:index]
  resources :admin
end
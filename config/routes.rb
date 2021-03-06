Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'help' => 'static_pages#help'
  get 'landing' => 'static_pages#landing'
  get 'about' => 'static_pages#about'
  get 'home' => 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'index' => 'users'
  get '/.well-known/acme-challenge/:id' => 'static_pages#letsencrypt'
  post '/.well-known/acme-challenge/:id' => 'static_pages#letsencrypt'

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  root 'static_pages#home'
  resources :users
  resources :emails
  resources :account_activations, only: [:edit]

end

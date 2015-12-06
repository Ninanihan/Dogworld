Rails.application.routes.draw do
  
  get 'pets/new'

  resources :users
  resources :pets
  resources :searches
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  
  root 'static_pages#home'

  get 'sessions/new'
  get 'users/new'
  
 


  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  
end

Rails.application.routes.draw do
  
  get 'pets/new'

  resources :users
  resources :pets do 
    resources :comments
  end
  resources :searches
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :products
  root 'static_pages#welcome'

  get 'sessions/new'
  get 'users/new'
  get 'users/index'
  get 'breeders/index'
  get 'products/index'
  get 'users/create'
 
  


  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  get    'microposts'   => 'static_pages#home'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
   match '/searched', to: 'search#search', via: 'get'
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  
end

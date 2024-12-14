Rails.application.routes.draw do
  #get "home/index"
  devise_for :user
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  #get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    root to: 'devise/sessions#new'
    
  end

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  # Página de login
  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  # Outras rotas
  get 'home', to: 'home#index'

  resources :remedios

  #get "/test_home", to: "home#index" # Rota para testar o HTML diretamente


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  #get "home/index"
  devise_for :user
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  #get "up" => "rails/health#show", as: :rails_health_check

  

  devise_scope :user do
    root to: 'devise/sessions#new' # Tela de login
  end
  
  authenticated :user do
    root to: 'home#new', as: :authenticated_root # Redireciona para a tela de cadastro de atendente
  end
  
  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root # Redireciona para a tela de login
  end

  # Outras rotas
  #get 'home', to: 'home#index'

  #get 'home', to: 'home#index'

  get 'home/new', to: 'home#new', as: :home_new
  get 'home/index', to: 'home#index', as: :home_index

  # Rotas para Atendentes
  resources :atendentes, only: [:create]

  resources :remedios, only: [:index, :new, :create, :edit, :update, :destroy]

  get "destroy", to: 'remedios#destroy'

  #post '/carrinho/finalizar', to: 'vendas#finalizar'

  resources :vendas, only: [:new, :create]

  resources :remedios do
    collection do
      get 'gerar_pdf', defaults: { format: 'pdf' }  # Define como uma ação de coleção sem precisar de um ID
    end
  end

  resources :vendas do
    collection do
      get :export_csv # Define a rota para a exportação
    end
  end
  

  #get "/test_home", to: "home#index" # Rota para testar o HTML diretamente


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

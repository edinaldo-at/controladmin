Rails.application.routes.draw do
  resources :tb_admins
  #devise_for :users
  devise_for :users, 
             controllers: {                                 
               sessions:           'users/sessions',                                                                             
               omniauth_callbacks: 'users/omniauth_callbacks'                                   
             }
  
  get 'home/index'
  get 'home/show'

  post '/tb_admins/importar', to: 'tb_admins#importar'

  devise_scope :user do
    root to: "users/sessions#new"
  end
end
Rails.application.routes.draw do
  namespace :admin do
    get 'dashboards/index'
  end

  root 'pages#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    omniauth: 'users/omniauth',
    unlocks: 'users/unlocks'
  }
  devise_scope :user do
    delete 'sign_out', :to => 'users/sessions#destroy'
    get '/login' => 'users/sessions#new'
    get '/register' => 'users/registrations#new'
    get '/settings' => 'users/registrations#edit'
  end

  resources :articles

  get "/dashboard" => 'dashboards#index'
end

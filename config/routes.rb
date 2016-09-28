Rails.application.routes.draw do
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
    get '/login' => 'users/sessions#new'
    get '/register' => 'users/registrations#new'
    get '/settings' => 'users/registrations#edit'
  end

  namespace :admin, path: '/master' do
    get "/" => "dashboards#index", as: 'master'
    resources :articles
  end

  get "/dashboard" => 'dashboards#index'
end

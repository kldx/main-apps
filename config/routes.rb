Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
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
    resources :articles, except: :show
  end

  get "/dashboard" => 'dashboards#index'
  get '/crew' => 'pages#crew'

  # articles
  get '/articles' => 'pages#articles'
  get '/articles/:id' => 'pages#article_show', as: 'article_show'
end

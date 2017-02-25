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
    resources :articles, except: :show do
      member do
        patch :mark_approve
        patch :mark_reject
        patch :mark_pending
      end
    end
    namespace :store, path: '/store' do
      get "/" => "dashboards#index"
      namespace :shop, path: '/shop' do
        resources :collections, except: [:edit, :update, :destroy], controller: 'collections' do
          resources :products, except: [:index, :destroy], controller: 'products'
        end
      end
      namespace :merchandise, path: '/merchandise' do
        resources :collections, except: [:edit, :update, :destroy] do
          resources :products, except: [:index, :destroy]
        end
      end
    end
  end

  resources :tags, only: [:index, :show]

  get "/dashboard" => 'dashboards#index'
  get '/crew' => 'pages#crew'

  # articles
  get '/articles' => 'pages#articles'
  get '/articles/:id' => 'pages#article_show', as: 'article_show'

  # products
  get '/products' => 'pages#products'
  get '/products/:id' => 'pages#product_show', as: 'product_show'
end

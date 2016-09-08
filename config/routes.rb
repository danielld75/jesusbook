Rails.application.routes.draw do

  root 'welcome#index'
  scope "/:locale/", locale: /en|pl/ do
    get 'profiles/show'
    get '/' => 'welcome#index'
    devise_for :users, :controllers => { :registrations => :registrations }
    get '/search' => 'welcome#search'
    get '/users' => 'users#index'
    get '/users/show/:id' => "users#show"
    get '/society' => "welcome#body"
    resources :posts, only: :index
    resources :users do
      resource :baptism
      resource :confirm_sacrament
      resource :marriage
      resource :priesthood
      resources :posts
    end
  end
end

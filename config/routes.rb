Rails.application.routes.draw do
  scope :api do
    resources :posts
    resources :contents
    resources :users
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

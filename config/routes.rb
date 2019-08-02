Rails.application.routes.draw do

  devise_for :users do
    get '/users/sign_up' =>  'devise/registrations#new'
  end



  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
end

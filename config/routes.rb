Rails.application.routes.draw do
  root 'cryptos#index'

  resources :cryptos

  get "load" => "cryptos#load"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

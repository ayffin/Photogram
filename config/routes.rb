Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "posts#index"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [ :create, :destroy]
  end
end

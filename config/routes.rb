Rails.application.routes.draw do
  devise_for :users
  root 'activities#index'
  get 'home/index'
  resource 'activities'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

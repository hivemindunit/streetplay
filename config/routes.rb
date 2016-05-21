Rails.application.routes.draw do
  get 'how_it_works/index'
  get 'faq/index'

  devise_for :users
  root 'activities#index'
  get 'home/index'
  #get 'activity/:id', to: 'activities#show'
  resources 'activities'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

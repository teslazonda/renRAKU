Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/index'
  get 'messages/create'
  get 'messages/index'
  get 'participants/create'
  get 'participants/index'
  get 'events/create'
  get 'events/index'
  get 'kurasus/create'
  get 'kurasus/edit'
  get 'kurasus/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

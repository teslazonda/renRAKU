Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#home'
  resources :kurasus, only: %i[index edit create new] do
    resources :schedules, only: %i[index new create]
    resources :meetings, only: %i[index show create new]
  end

  resources :schedules, only: %i[edit update]
  resources :meetings, only: %i[edit update]

  resources :events, only: %i[index create new edit update destroy] do
    resources :participants, only: %i[index create new]
  end

  resources :students, only: [] do
    resources :grades, only: %i[index create new]
  end

  resources :students, only: [] do
    resources :messages, only: %i[index create new]
  end

  resources :messages, only: %i[show] do
    resources :comments, only: %i[create new]
  end

  resources :dashboards, only: %i[index]
  # /dashboard
  devise_for :users
  get '/dashboard' => "dashboards#index", :as => :user_root
  # creating route for comment button
  get '/messages/:id/read' => "messages#read", :as => :comments_read

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

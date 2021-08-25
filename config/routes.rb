Rails.application.routes.draw do
  root to: 'pages#home'
  resources :kurasus, only: %i[index edit create new]
  resources :events, only: %i[index create new edit update] do
    resources :participants, only: %i[index create new]
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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

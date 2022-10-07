Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'
  devise_for :users

  resources :teachers, only: [:index, :show]
  resources :students, only: [:index, :show]
  resources :lesson_plans, only: [:show]
  resources :lessons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

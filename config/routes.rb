Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
  }

  resources :training_areas
  resources :exercises
  resources :goals
  resources :workouts
  resources :training_periods, path: 'periodization'

  get '/calendar' => 'training#calendar', as: :training_calendar
  get '/motivate' => 'training#motivate', as: :training_motivation
  get '/training' => 'training#index', as: :training
  get '/training/stats' => 'training#stats', as: :training_stats
end

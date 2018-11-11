Rails.application.routes.draw do
  get 'assignments/create'
  get 'assignments/new'
  devise_for :users, controllers: {
    sessions: :sessions,
    registrations: :registrations
  }
  resources :patterns, only: [:create] do
    resources :shifts, only: [:show, :new, :create, :edit, :update]
  end

  resources :staffs, only: [:create] do
    resources :assignments, only: [:create, :new, :edit, :update]
  end

  root controller: :schedules, action: :index
  resources :schedules, only: [:index, :show, :create, :new] 

end

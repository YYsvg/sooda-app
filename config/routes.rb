Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

  namespace :admin do
    devise_scope :user do
      get 'login',        to: 'sessions#new'
      post 'login',       to: 'sessions#create'
      delete 'logout',    to: 'sessions#destroy'
    end
    resources :dashboard, only: [:index]
    root to: 'dashboard#index'
  end


  resource :users, only: [ :edit, :update ] do
    collection do
      get 'mypage',     :to => 'users#mypage'
      get 'mypage/calendar',   :to => 'users#calendar'
    end
  end


  get 'homes', to: 'homes#index'

  resources :incomes
  resources :outcomes
  resources :income_categories
  resources :outcome_categories
  resources :wants

end

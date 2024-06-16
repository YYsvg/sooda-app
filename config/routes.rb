Rails.application.routes.draw do

  get 'users/mypage'
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

resource :users, only: [ :edit, :update ] do
  collection do
    get 'mypage',     :to => 'users#mypage'
    get 'mypage/calendar',   :to => 'users#calendar'
    get 'mypage/month',      :to => 'users#month'
    get 'mypage/year',       :to => 'users#year'
  end
end


get 'homes', to: 'homes#index'

resources :incomes
resources :outcomes
resources :income_categories
resources :outcome_categories
resources :wants

end

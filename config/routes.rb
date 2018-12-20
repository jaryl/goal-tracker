Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  namespace :my do

    resource :account, only: [:show, :update]

    resources :goals, only: [:index, :show, :new, :create] do
      resources :items, only: [:new, :create]
    end

  end

  namespace :admin do
    resources :users, only: [:index, :show]
  end


  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

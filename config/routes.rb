Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  root 'users/recruitings#index'

  namespace :users do 
    resources :persons do
      member do
        get :favorites
      end
    end
    resources :recruitings do
      get 'owner/:id' => 'recruitings#owner'
       resource :favorites, only: [:create, :destroy]
      resources :talks, only: [:create, :destroy]
    end

  end
  
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

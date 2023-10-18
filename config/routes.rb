Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  root 'users/recruitings#index'
  
  namespace :users do
    resources :recruitings do
      get 'owner/:id' => 'recruitings#owner'
      resource :favorites, only: [:create, :destroy]
      resources :talks, only: [:create, :destroy]
    end
    resources :persons
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

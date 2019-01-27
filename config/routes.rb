Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  resources :rooms
  resources :genres, only: [:index, :show]
  get 'home/index'
  root 'genres#index'
  resources :users, :only => [:show, :edit, :update]
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    sessions: "users/sessions",
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

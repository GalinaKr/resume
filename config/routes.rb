Rails.application.routes.draw do

  get '/join', to: 'start#index'
  post '/join/signup', to: 'start#signup'

  devise_for :users, controllers: {
    passwords: 'passwords',
    registrations: 'registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get '/password_reset', to: 'passwords#password_reset'
    get '/sign_up', to: 'registrations#sign_up'
  end

  resources :users
  resources :profiles

  resources :avatar, only: %i[update destroy]
  resources :profile_steps

  root 'join#index'
end

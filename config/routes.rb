Rails.application.routes.draw do

  get '/join', to: 'join#index'
  post '/join/signup', to: 'join#signup'

  devise_for :users, controllers: {
    passwords: 'passwords',
    registrations: 'registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get '/password_reset', to: 'passwords#password_reset'
    get '/sign_up', to: 'registrations#sign_up'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :users
  resources :families
  resources :profiles

  post 'change_family', to: 'profile#change_family'
  post 'change_basic_info', to: 'profile#change_basic_info'
  post 'change_education', to: 'profile#change_education'
  post 'add_educations', to: 'profile#change_educations'

  resources :avatar, only: %i[update destroy]
  resources :profile_steps

  root 'join#index'
end

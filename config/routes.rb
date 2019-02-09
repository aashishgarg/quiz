Rails.application.routes.draw do
  post 'sign-up', to: 'registrations#create', as: 'sign_up'
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraint.new(version: 1, default: true) do
      resources :quizsets
    end
  end
  post 'sign-up', to: 'registrations#create', as: 'sign_up'
end

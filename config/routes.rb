Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraint.new(version: 1, default: true) do
      resources :questions
      resources :quizzes do
        resources :question_attempts, only: %i[create]
      end
      resources :quizsets
      resources :users, only: [:index] do
        collection do
          get 'top', to: redirect { |_, request| "api/users?top=true&#{request.query_string}" }
        end
      end
    end
  end

  post 'sign-up', to: 'registrations#create', as: 'sign_up'
end

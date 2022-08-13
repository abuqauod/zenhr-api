Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do

      resource :jobs, :users, :job_application

      get 'jobs/index'
      get 'jobs/show'

      get 'job_application/index'
      get 'job_application/show'

    end
  end
  post '/auth/login', to: 'authentication#login'
end
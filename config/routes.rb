Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'questions#index'
  get '/questions/:id/answers', to: 'questions#show'
  resources :questions do
    resources :answers
  end
end

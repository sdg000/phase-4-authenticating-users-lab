Rails.application.routes.draw do
  resources :articles, only: [:index, :show]

  # custom route for user login
  post "/login", to: "sessions#create"

  #custom route for user logout
  delete "/logout", to: "sessions#destroy"

  #custom route to allow user to remain logged in after page refresh
  #this route find user from UsersController, by their session[:user_id]
  get "/me", to: "users#show"
end

Rails.application.routes.draw do

  root 'tasks#index'
  resources :tasks

  get '/about' => 'pages#about'

end

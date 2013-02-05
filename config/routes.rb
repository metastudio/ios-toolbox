IosToolbox::Application.routes.draw do
  resources :projects, only: [:new, :create]

  root :to => 'dashboard#show'
end

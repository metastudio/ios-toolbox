IosToolbox::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :projects, only: [:new, :create] do
    collection do
      get 'by_tag'
    end
  end

  root :to => 'dashboard#show'
end

IosToolbox::Application.routes.draw do
  resources :projects, only: [:new, :create] do
    collection do
      get 'by_tag'
    end
  end

  root :to => 'dashboard#show'
end

Void::Application.routes.draw do
  resources :posts, :only => [:create, :index]
  root :to => 'application#index'
end

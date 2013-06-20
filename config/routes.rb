Void::Application.routes.draw do
  resources :posts, :only => [:create, :show, :destroy]
  root :to => 'application#index'
end

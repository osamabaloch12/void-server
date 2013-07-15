Void::Application.routes.draw do
  resources :users, :only => [] do
    resources :posts, :only => [:create, :index, :destroy]
  end

  root :to => 'application#index'
end

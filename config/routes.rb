Void::Application.routes.draw do
  resources :users, :only => [] do
    resources :posts, :only => [:create, :index, :destroy] do
      member do
        post 'like', to: 'likes#create'
        delete 'unlike', to: 'likes#destroy'
      end
    end
  end

  root :to => 'application#index'
end

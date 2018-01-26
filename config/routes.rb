Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :boards, only: [:index, :show]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      get "/users/:name", to: 'users#show'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :board_users, only: [:create]
      get "/board_users/:user_id/:board_id", to: 'board_users#show'
      patch "/board_users/:user_id/:board_id", to: 'board_users#update'
      patch "/board_users/progress/:user_id/:board_id", to: 'board_users#update_progress'
    end
  end

end

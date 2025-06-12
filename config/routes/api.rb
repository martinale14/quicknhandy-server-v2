namespace :api do
  namespace :v1 do
    resources :users, only: [ :create ]
    resource :profile, only: [ :show, :update, :destroy ]
    resources :addresses, only: [ :index, :show, :create, :update, :destroy ]
    resource :sessions, only: [ :create, :destroy ] do
      post :checkin
    end
  end
end

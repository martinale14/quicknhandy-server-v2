# Below are the routes for madmin
namespace :madmin do
  mount SolidQueueDashboard::Engine, at: 'solid-queue'
  resources :roles
  resources :users

  root to: "dashboard#show"
end

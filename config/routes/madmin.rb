# Below are the routes for madmin
namespace :madmin do
  namespace :action_text do
    resources :rich_texts
  end
  resources :service_types
  resources :categories
  resources :addresses
  resources :coverage_zones
  resources :cities
  resources :countries
  mount SolidQueueDashboard::Engine, at: 'solid-queue'
  resources :roles
  resources :users

  root to: "dashboard#show"
end

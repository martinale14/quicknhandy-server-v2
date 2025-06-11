source "https://rubygems.org"

gem "ancestry", "~> 4.3", ">= 4.3.3"

gem "bcrypt", "~> 3.1", ">= 3.1.20"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "geokit-rails", "~> 2.5"
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.13"
# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

gem "madmin", "~> 2.0", ">= 2.0.2"

gem "mobility", "~> 1.3", ">= 1.3.2"

gem "pagy", "~> 9.3", ">= 9.3.4"

gem "pg", "~> 1.5", ">= 1.5.9"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

gem "rails", "~> 8.0.2"

gem "redis-objects", "~> 1.7"

gem "rolify", "~> 6.0", ">= 6.0.1"

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_queue_dashboard", "~> 0.2.0"
gem "solid_cable"
# Hotwire"s modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

gem "tailwindcss-rails", "~> 4.2", ">= 4.2.3"
# Hotwire"s SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "dotenv", "~> 3.1", ">= 3.1.8"
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "foreman", "~> 0.88.1"
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

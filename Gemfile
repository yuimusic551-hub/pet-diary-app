# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.0'

gem 'pg'

gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.6'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'active_hash'
gem 'devise'
gem 'rails-i18n'

group :development, :test do
  
  gem 'mysql2', '~> 0.5'
  gem 'debug', platforms: %i[mri windows]
  gem 'rspec-rails', '~> 7.1.0'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
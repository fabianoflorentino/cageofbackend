source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip.split('-').last.to_s

gem 'rails', '>= 7.0.8'

gem 'bootsnap', require: true
gem 'dotenv-rails', '~> 2.8.1'
gem 'httparty', '~> 0.21.0'
gem 'jsonapi-serializer', '~> 2.2.0'
gem 'mysql2', '~> 0.5.5'
gem 'nokogiri', '>= 1.15.4'
gem 'pagy', '~> 6.1.0'
gem 'puma', '>= 6.4.0'
gem 'pundit', '~> 2.3.1'
gem 'rack', '>= 2.2.8'
gem 'rack-attack', '~> 6.7.0'
gem 'rack-cors', '~>  1.1.1'
gem 'ransack', '~> 4.1.1'
gem 'redis', '~> 4.7.1'
gem 'redlock', '~> 2.0', '>= 2.0.1'
gem 'rspec', '>= 3.11.0'
gem 'tzinfo-data'

group :development, :test do
  gem 'brakeman', '~> 6.0', require: false
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 3.2.1'
  gem 'pry'
  gem 'rubocop', '~> 1.56.4', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', '~> 2.21.2', require: false
  gem 'rubocop-rspec', '~> 2.24.1', require: false
  gem 'rubocop-shopify', require: false
end

group :test do
  gem 'rspec-rails', '~> 5.1.2'
  gem 'shoulda-matchers', '~> 5.3.0'
  gem 'webmock'
end

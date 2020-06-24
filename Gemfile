source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
gem 'rails', '6.0.3.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'sass', '3.7.4'
gem 'paperclip', '6.1.0'
gem 'gs', '0.2.0'
gem 'simple_form', '5.0.2'
gem 'bootstrap-sass'
gem 'listen', '3.2.1'

gem 'wdm'
gem 'sidekiq' , '<5'
gem 'redis'
gem 'redis-namespace', '1.7.0'
gem "simple_calendar", "~> 2.0"
gem 'rack', '2.2.3'
gem 'sinatra', require: false
gem 'slim'
gem 'rake', '13.0.1'
gem 'coffee-rails'
gem 'pundit', '2.1.0'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem "actionpack", ">= 5.2.4.3"
gem "activesupport", ">= 5.2.4.3"
gem "actionview", ">= 5.2.4.2"
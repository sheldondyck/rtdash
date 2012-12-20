source 'http://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'faye'
#gem 'thin'

gem 'libv8'
gem 'therubyracer'
gem 'haml'
gem 'faker'
gem 'jquery-rails'
gem 'bcrypt-ruby'
gem 'foreigner'

group :production do
  gem 'pg'
  # Use unicorn as the web server
  # gem 'unicorn'

  # Deploy with Capistrano
  # gem 'capistrano'
end

group :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'spork-rails'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'libnotify'
  gem 'annotate' #, :git => 'git://github.com/ctran/annotate_models.git'
  gem 'capybara'
  gem 'launchy'
  gem 'perftools.rb'
  gem "better_errors"
  gem "binding_of_caller"
  # To use debugger
  # gem 'ruby-debug19', :require => 'ruby-debug'
end

group :linux_development do
  gem 'rb-inotify'
end

group :mac_development do
  gem 'rb-fsevent'
end

group :test do
  gem 'sqlite3'
  # Pretty printed test output
  gem 'turn', '>= 0.8.3', :require => false
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


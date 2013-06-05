source 'http://rubygems.org'

gem 'rails', '4.0.0.rc1'
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'faye'
#gem 'thin'

#gem 'libv8'
#gem 'libv8', '~> 3.16.14.1'
gem 'therubyracer', require: 'libv8'
gem 'haml'
gem 'faker'
gem 'jquery-rails'
gem 'bcrypt-ruby'
gem 'foreigner'

gem 'sass-rails', '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

# rails 4.0 upgrade gems
gem 'protected_attributes'
gem 'rails-observers'

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
  gem 'guard'
  gem 'guard-zeus'
  gem 'guard-rspec'
  gem 'libnotify'
  gem 'annotate' #, :git => 'git://github.com/ctran/annotate_models.git'
  gem 'capybara'
  gem 'launchy'
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
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
  gem 'turn', '>= 0.8.3', :require => false
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
end

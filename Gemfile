source 'http://rubygems.org'

gem 'rails', '3.2.5'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'faye'
#gem 'thin'

gem 'therubyracer'
gem 'haml'
gem 'faker'
gem 'jquery-rails'
gem 'bcrypt-ruby'
gem 'foreigner'

group :development do
  gem 'sqlite3'
	gem 'rspec-rails'
	# default annotate was throwing an exception with rake 0.9
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
	gem 'spork'
  gem 'libnotify'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'sqlite3'
  # Pretty printed test output
  gem 'turn', '>= 0.8.3', :require => false
	gem 'rspec'
	gem 'webrat'
	gem 'spork'
  gem 'libnotify'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'factory_girl_rails'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


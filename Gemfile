source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'therubyracer'
gem 'haml'
gem 'faker'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'

group :development do
	gem 'rspec-rails'
	# default annotate was throwing an exception with rake 0.9
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
	gem 'rspec'
	gem 'webrat'
	gem 'spork'
end

group :production do
  gem 'pg'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


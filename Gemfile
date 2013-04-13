source 'https://rubygems.org'
ruby "1.9.3"

# Distribute your app as a gem
# gemspec

gem 'padrino', '0.11.1'

# Server requirements
gem 'unicorn'
gem 'foreman'

# Optional JSON codec (faster performance)
# gem 'oj'

group :production do
  gem 'pg'
end

group :development do
  gem 'uglifier'
  gem 'yui-compressor'
  gem 'coffee-script'
  gem 'pry'
  gem 'puma'
end

# Test requirements
group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

# Assets
gem 'sprockets-helpers', require: 'sinatra/sprockets-helpers'
gem 'sprockets-sass', require: 'sprockets-sass'
gem 'sass'
gem 'boarding_pass'

# Project requirements
gem 'rake'
gem 'haml'
gem 'pry'

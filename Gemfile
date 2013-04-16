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
  gem 'puma'
end

# Test requirements
group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

gem 'dotenv', :groups => [:development, :test], :require => 'dotenv'

# Assets
gem 'sinatra-assetpack', :require => 'sinatra/assetpack'
gem 'uglifier'
gem 'yui-compressor'
gem 'coffee-script'
gem 'sass'
gem 'compass'
gem 'boarding_pass'

# Project requirements
gem 'rake'
gem 'sinatra-contrib'
gem 'slim'
gem 'pry'
gem 'newrelic_rpm'
gem 'active_attr'
gem 'wuparty'

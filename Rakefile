PADRINO_ENV = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development' unless defined?(PADRINO_ENV)

require 'bundler/setup'
require 'padrino-core/cli/rake'

Bundler.require(PADRINO_ENV)

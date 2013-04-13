PADRINO_ENV = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development' unless defined?(PADRINO_ENV)

require 'bundler/setup'
require 'padrino-core/cli/rake'
require 'sprockets/../rake/sprocketstask'
require 'padrino'

Bundler.require(PADRINO_ENV)
require File.expand_path("../config/boot.rb", __FILE__)

PadrinoTasks.init
 
# Sprockets
sprockets = Sprockets::Environment.new(OnePageSites::App.root)

%w(javascripts stylesheets images fonts).each do |dir|
  sprockets.append_path "assets/#{dir}"
end

sprockets.js_compressor = Uglifier.new(mangle: true)
sprockets.css_compressor = YUI::CssCompressor.new

Rake::SprocketsTask.new do |t|
  manifest_path = File.join(Padrino.root,'public','assets','manifest.json')
  t.environment = sprockets
  t.output      = File.join(Padrino.root,'public','assets')
  t.manifest    = Sprockets::Manifest.new(sprockets, manifest_path)
  t.assets      = %w(application.js application.css *.png *.gif *.jpg *.jpeg *.eot *.svg *.ttf *.woff)
end

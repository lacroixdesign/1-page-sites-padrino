require 'sinatra/json'

module OnePageSites
  class App < Padrino::Application
    register ScssInitializer
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Sinatra::AssetPack

    helpers Sinatra::JSON

    enable :sessions

    set :allow_disabled_csrf, true
    set :root, File.dirname(__FILE__)
    # set :slim, layout: :"layouts/application"

    ##
    # Sass/Compass
    #
    Compass.configuration do |config|
      config.images_dir = 'images'
      # config.sass_dir   = 'stylesheets'
      config.fonts_dir   = 'fonts'
    end
    set :sass, Compass.sass_engine_options
    set :sass, { load_paths: sass[:load_paths] + [ "#{root}/assets/stylesheets" ] }
    # set :sass, { load_paths: [ "#{root}/assets/stylesheets" ] }
    set :scss, sass

    ##
    # Assets
    #
    assets do
      serve '/javascripts', from: 'assets/javascripts'
      serve '/stylesheets', from: 'assets/stylesheets'
      serve '/images',      from: 'assets/images'
      serve '/fonts',       from: 'assets/fonts'

      js :application, [
        '/javascripts/vendor/jquery-1.9.1.min.js',
        '/javascripts/vendor/angular.min.js',
        '/javascripts/vendor/mailcheck.min.js',
        '/javascripts/vendor/jquery.scrollTo.min.js',
        '/javascripts/vendor/jquery.localScroll.min.js',
        '/javascripts/lib/**/*.js',
        '/javascripts/lib/*.js',
        '/javascripts/components/**/*.js',
        '/javascripts/components/*.js'
      ]
      js :html5,     ['/javascripts/polyfills/html5shim.js']
      js :polyfills, ['/javascripts/polyfills/selectivizr.js']

      css :application, [
        '/stylesheets/application.css'
      ]

      js_compression  :uglify
      css_compression :sass
    end

    ##
    # Caching support
    #
    register Padrino::Cache
    enable :caching if environment == :production
    #
    # You can customize caching store engines:
    #
    # set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
    # set :cache, Padrino::Cache::Store::Memory.new(50)
    set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache'))
    #

    ##
    # Application configuration options
    #
    # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
    # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, 'foo/bar' # Location for static assets (default root/public)
    # set :reload, false            # Reload application files (default in development)
    # set :default_builder, 'foo'   # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, 'bar'       # Set path for I18n translations (default your_app/locales)
    # disable :sessions             # Disabled sessions by default (enable if needed)
    # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    ##
    # You can configure for a specified environment like:
    #
    #   configure :development do
    #     set :foo, :bar
    #     disable :asset_stamp # no asset timestamping for dev
    #   end
    #
    configure :production do
      require 'newrelic_rpm'
    end

    ##
    # You can manage errors like:
    #
    #   error 404 do
    #     render 'errors/404'
    #   end
    #
    #   error 505 do
    #     render 'errors/505'
    #   end
    #
  end
end

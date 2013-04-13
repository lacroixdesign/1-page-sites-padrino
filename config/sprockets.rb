module Padrino::Sprockets
  def self.registered(base)
    base.set :sprockets, ::Sprockets::Environment.new(base.root)
 
    # Add folder
    %w(javascripts stylesheets images fonts).each do |dir|
      base.sprockets.append_path "assets/#{dir}"
    end

    # base.set :digest_assets, true
    base.set :digest_assets, true
 
    # sprockets-helpers
    base.helpers Sprockets::Helpers
    # We can configure `sprockets-helpers` to find the correct assets for us.
    Sprockets::Helpers.configure do |config|
      config.environment = base.sprockets
      config.prefix      = '/assets'
      config.digest      = true
      config.public_path = base.public_folder

      unless PADRINO_ENV == 'development'
        manifest_path      = File.join(Padrino.root,'public','assets','manifest.json')
        config.manifest    = Sprockets::Manifest.new(base.sprockets, manifest_path)
      end
    end
 
    # call sprockets :D
    if PADRINO_ENV == 'development'
      base.get '/assets/*splat' do
        # env['PATH_INFO'].gsub!(%r{\A/?assets}, '')
        # settings.sprockets.call(env)
      end
    end
  end
end

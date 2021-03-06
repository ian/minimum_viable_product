require 'carrierwave'
require 'cloudinary'
require 'faraday'
require 'fog'
require 'geocoder'
require 'hashie'
require 'rack-canonical-host'
require 'rack-ssl-enforcer'
require 'rollbar'
require 'sitemap_generator'
require 'slack-notifier'

require_relative './ext/nil'
require_relative './ext/string'

module MVP
  class Engine < ::Rails::Engine
    isolate_namespace MVP
    # config.autoload_paths << "#{Rails.root}/app"
    # config.autoload_paths << "#{Rails.root}/lib"
  end
end

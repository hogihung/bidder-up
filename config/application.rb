require_relative 'boot'

require 'rails/all'
require_relative 'gc_disabler'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BidderUp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Setting to support Ruby Prof
    config.middleware.use Rack::RubyProf, path: '/tmp/rails_profile'
    config.middleware.insert_before Rack::RubyProf, GCDisabler
  end
end


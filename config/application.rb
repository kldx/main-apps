require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kldx
  class Application < Rails::Application
    config.time_zone = 'Asia/Kuala_Lumpur'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false
    config.encoding = "utf-8"
  end
end

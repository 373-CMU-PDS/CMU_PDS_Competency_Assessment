require File.expand_path('../boot', __FILE__)

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PDSAssessment
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/lib/**/"]  # include all subdirectories
  end
end
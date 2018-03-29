require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PettyMoneyKing
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.action_controller.action_on_unpermitted_parameters = :raise
    config.autoload_paths += %W(#{config.root}/lib)
    config.active_job.queue_adapter = :sidekiq
    config.eager_load_paths += %W( #{config.root}/app/jobs )
    config.eager_load_paths += %W( #{config.root}/app/workers )
    config.time_zone = 'Taipei'
    config.i18n.default_locale = :'zh-CN'
  end
end

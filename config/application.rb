require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Resume
  class Application < Rails::Application
    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths << Rails.root.join('lib', 'migrations')
    config.autoload_paths << "#{Rails.root}/app/resume"

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Suppress automatic generation of certain types of specs
    # Per https://www.codewithjason.com/get-rspec-skip-view-specs-generate-scaffolds/
    config.generators do |generate|
      generate.test_framework :rspec,
                              fixtures: false,
                              view_specs: false,
                              helper_specs: false,
                              routing_specs: false,
                              request_specs: false,
                              controller_specs: false
    end

    # Suppress automatic generation of stylesheets per
    # https://stackoverflow.com/questions/14045858/syntax-to-skip-creating-tests-assets-helpers-for-rails-generate-controller
    config.generators.stylesheets = false
    config.generators.helper = false

    # Stop activeadmin files from crashing on heroku.
    # See https://stackoverflow.com/questions/57277351/rails-6-zeitwerknameerror-doesnt-load-class-from-module
    config.autoloader = :classic

    config.exceptions_app = self.routes
    config.i18n.available_locales = %w(en ua ru)
  end
end

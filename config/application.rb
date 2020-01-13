require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CarRental
  ROL_DRIVER = "driver"
  ROL_PASSENGER = "passenger"
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Loads local env file according to env
    config.before_configuration do
      env_file_path = File.join(Rails.root, 'config', 'env_vars.yml')
      YAML.load(File.open(env_file_path)).each do |environment_key, environment_hash|
        if environment_key.eql?(Rails.env) && !environment_hash.nil?
          environment_hash.each do |key, value|
            ENV[key.to_s.upcase] = value
          end
        end
      end if File.exist?(env_file_path)
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.jbuilder false
      g.test_framework nil
      g.assets false
      g.helper false
      g.stylesheets false
    end

    config.assets.paths << Rails.root.join('vendor', 'assets', 'sb_admin')
    config.assets.paths << Rails.root.join('vendor', 'assets', 'select2')
    config.assets.precompile += ['application-print.css']
  end
end

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gokuy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
	    config.generators do |g|
		    g.test_framework :rspec,
		      fixtures: true,
		      view_specs: false,
		      helper_specs: false,
		      routing_specs: false,
		      controller_specs: true,
		      request_specs: false
		    g.fixture_replacement :factory_girl, dir: "spec/factories"
	  	end

	  	config.time_zone = 'Asia/Bangkok'
 		config.active_record.default_timezone = :local

	  	# custom redirect for authenticate
	  	config.autoload_paths << Rails.root.join('lib')

	  	# avoiding 'field_with_error' to change page appearance
	  	config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
	  	  html_tag
	  	}
  end
end

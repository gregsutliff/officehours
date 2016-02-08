require File.expand_path('../boot', __FILE__)
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Organizer2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those
    # specified here.
  config.generators do |g|
    g.test_framework :rspec, :fixture => false
    g.view_specs false
    g.helper_specs false
    g.controller_specs false
    g.model_specs false
  end
  # Do not swallow errors in after_commit/after_rollback callbacks.
  config.active_record.raise_in_transactional_callbacks = true
  end
end

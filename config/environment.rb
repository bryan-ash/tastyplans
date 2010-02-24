
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'haml'
  config.gem 'pauldix-feedzirra', :lib => 'feedzirra', :source => 'http://gems.github.com'
  
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  config.frameworks -= [ :active_resource, :action_mailer ]

  config.time_zone = 'UTC'

end

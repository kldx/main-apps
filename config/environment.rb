# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Raven.configure do |config|
  config.dsn = 'https://ebd61199ba6c4407b6db8066d506246e:9948663f5727477ea40be8af11f88c29@sentry.io/102630'
  config.environments = ['production']
end

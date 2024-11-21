require 'rspec'
require 'active_support'
require 'active_support/testing/assertions'
require 'active_support/testing/time_helpers'
require 'active_support/testing/file_fixtures'
require 'active_support/testing/isolation'
require 'active_support/testing/deprecation'
require 'active_support/testing/constant_lookup'

# require ../lib/main to load the application
require_relative '../lib/main'

RSpec.configure do |config|

  # include ActiveSupport testing assertions
  config.include ActiveSupport::Testing::Assertions

  # include ActiveSupport::Testing::ConstantLookup
  config.include ActiveSupport::Testing::ConstantLookup

  # include ActiveSupport::Testing::Deprecation
  config.include ActiveSupport::Testing::Deprecation

  # include ActiveSupport::Testing::TimeHelpers
  config.include ActiveSupport::Testing::TimeHelpers
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
# encoding: utf-8
require 'rspec'
require 'rspec_tag_matchers'

require 'rubygems'
require 'bundler'
Bundler.setup

require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_controller'
require 'action_dispatch'

RSpec.configure do |config|
  config.include RspecTagMatchers
  # config.include CustomMacros
  config.mock_with :rspec
end

require "action_controller/railtie"
require 'active_model'

# Create a simple rails application for use in testing the viewhelper
module FormtasticTest
  class Application < ::Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    config.active_support.deprecation = :stderr
  end
end
FormtasticTest::Application.initialize!

require 'rspec/rails'

# Quick hack to avoid the 'Spec' deprecation warnings from rspec_tag_matchers
module Spec
  include RSpec
end

require 'formtastic-bootstrap'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include RspecTagMatchers  
  config.include CustomMacros
end

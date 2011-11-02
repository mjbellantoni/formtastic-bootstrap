$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
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

require 'formtastic-bootstrap'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include RspecTagMatchers  
  config.include CustomMacros
end

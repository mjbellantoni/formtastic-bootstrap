require 'bundler/setup'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

# require 'rspec'
# require 'rspec_tag_matchers'
# require 'rubygems'

# Find Formtastic and grab its testing support first.
formtastic_full_gem_path = Bundler.load.specs.find{|s| s.name == "formtastic" }.full_gem_path
require File.join(formtastic_full_gem_path, 'spec', 'spec_helper.rb')

# Now add in ours.
require 'formtastic-bootstrap'
require File.join(File.dirname(__FILE__), "support", "custom_macros.rb")
require File.join(File.dirname(__FILE__), "support", "fb_custom_macros.rb")


RSpec.configure do |config|
  config.before(:suite) do
    Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder
  end
  config.include FbCustomMacros
end

# RSpec.configure do |config|
#   config.include RspecTagMatchers  
#   config.include CustomMacros
# end

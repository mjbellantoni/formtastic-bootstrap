require "formtastic"
require "formtastic/version"
require "formtastic-bootstrap/engine" if defined?(::Rails) # For tests
require "formtastic-bootstrap/helpers"
require "formtastic-bootstrap/inputs"
require "formtastic-bootstrap/actions"
require "formtastic-bootstrap/form_builder"
require "action_view/helpers/text_field_date_helper"

module FormtasticBootstrap
  extend ActiveSupport::Autoload

  # autoload :FormBuilder
  # autoload :Helpers
  # autoload :HtmlAttributes
  # autoload :I18n
  # autoload :Inputs,  "formtastic-bootstrap/inputs"
  # autoload :Actions, "formtastic-bootstrap/actions"
  # autoload :LocalizedString
  # autoload :Localizer
  # autoload :Util

end

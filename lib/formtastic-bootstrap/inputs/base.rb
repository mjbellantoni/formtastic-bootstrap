require "formtastic-bootstrap/inputs/base/errors"
require "formtastic-bootstrap/inputs/base/hints"
require "formtastic-bootstrap/inputs/base/html"
require "formtastic-bootstrap/inputs/base/labelling"

module FormtasticBootstrap
  module Inputs
    module Base
      extend ActiveSupport::Autoload

      autoload :DatetimePickerish,  "formtastic-bootstrap/inputs/base/datetime_pickerish"
      # autoload :Associations
      autoload :Collections,  "formtastic-bootstrap/inputs/base/collections"
      autoload :Choices,      "formtastic-bootstrap/inputs/base/choices"
      # autoload :Database
      # autoload :Errors
      # autoload :Fileish
      # autoload :Hints
      # autoload :Html
      # autoload :Labelling
      # autoload :Naming
      autoload :Numeric,      "formtastic-bootstrap/inputs/base/numeric"
      # autoload :Options
      autoload :Placeholder,  "formtastic-bootstrap/inputs/base/placeholder"
      autoload :Stringish,    "formtastic-bootstrap/inputs/base/stringish"
      autoload :Timeish,      "formtastic-bootstrap/inputs/base/timeish"
      # autoload :Validations
      autoload :Wrapping,     "formtastic-bootstrap/inputs/base/wrapping"

      include Html
      # include Options
      # include Database
      # include Database
      include Errors
      include Hints
      # include Naming
      # include Validations
      # include Fileish
      # include Associations
      include Labelling
      include Wrapping

    end
  end
end

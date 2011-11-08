require "formtastic-bootstrap/inputs/base/choices"
require "formtastic-bootstrap/inputs/base/errors"
require "formtastic-bootstrap/inputs/base/hints"
require "formtastic-bootstrap/inputs/base/html"
require "formtastic-bootstrap/inputs/base/labelling"
require "formtastic-bootstrap/inputs/base/stringish"
require "formtastic-bootstrap/inputs/base/timeish"
require "formtastic-bootstrap/inputs/base/wrapping"

module FormtasticBootstrap
  module Inputs
    module Base

      include Errors
      include Hints
      include Html
      include Labelling
      include Wrapping
      
    end
  end
end

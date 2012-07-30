require "crowdtastic/inputs/base/choices"
require "crowdtastic/inputs/base/errors"
require "crowdtastic/inputs/base/hints"
require "crowdtastic/inputs/base/html"
require "crowdtastic/inputs/base/labelling"
require "crowdtastic/inputs/base/stringish"
require "crowdtastic/inputs/base/timeish"
require "crowdtastic/inputs/base/wrapping"

module Crowdtastic
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

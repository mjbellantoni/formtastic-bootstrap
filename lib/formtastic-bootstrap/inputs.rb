require "formtastic-bootstrap/inputs/base"

require "formtastic-bootstrap/inputs/date_input"
require "formtastic-bootstrap/inputs/datetime_input"
require "formtastic-bootstrap/inputs/email_input"
require "formtastic-bootstrap/inputs/file_input"
require "formtastic-bootstrap/inputs/hidden_input"
require "formtastic-bootstrap/inputs/number_input"
require "formtastic-bootstrap/inputs/password_input"
require "formtastic-bootstrap/inputs/phone_input"
require "formtastic-bootstrap/inputs/radio_input"
require "formtastic-bootstrap/inputs/range_input"
require "formtastic-bootstrap/inputs/search_input"
require "formtastic-bootstrap/inputs/select_input"
require "formtastic-bootstrap/inputs/string_input"
require "formtastic-bootstrap/inputs/text_input"
require "formtastic-bootstrap/inputs/time_input"
require "formtastic-bootstrap/inputs/time_zone_input"
require "formtastic-bootstrap/inputs/url_input"

module FormtasticBootstrap
  module Inputs

    include Base # TODO: Understand why I need to do this.
    # autoload :Base, "formtastic-bootstrap/inputs/base"
    autoload :BooleanInput,    "formtastic-bootstrap/inputs/boolean_input" 
    autoload :CheckBoxesInput, "formtastic-bootstrap/inputs/check_boxes_input"
    # autoload :DateSelectInput, "formtastic-bootstrap/inputs/date_select_input"

  end
end


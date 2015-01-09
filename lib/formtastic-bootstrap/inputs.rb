module FormtasticBootstrap
  module Inputs
    extend ActiveSupport::Autoload

    autoload :Base,                "formtastic-bootstrap/inputs/base"
    # autoload :Basic
    autoload :BooleanInput,        "formtastic-bootstrap/inputs/boolean_input"
    autoload :CheckBoxesInput,     "formtastic-bootstrap/inputs/check_boxes_input"
    autoload :ColorInput,        "formtastic-bootstrap/inputs/color_input"
    autoload :CountryInput,        "formtastic-bootstrap/inputs/country_input"
    autoload :DateInput,           "formtastic-bootstrap/inputs/date_input"
    autoload :DatePickerInput,     "formtastic-bootstrap/inputs/date_picker_input"
    autoload :DatetimePickerInput, "formtastic-bootstrap/inputs/datetime_picker_input"
    autoload :DateSelectInput,     "formtastic-bootstrap/inputs/date_select_input"
    autoload :DatetimeInput,       "formtastic-bootstrap/inputs/datetime_input"
    autoload :DatetimeSelectInput, "formtastic-bootstrap/inputs/datetime_select_input"
    autoload :EmailInput,          "formtastic-bootstrap/inputs/email_input"
    autoload :FileInput,           "formtastic-bootstrap/inputs/file_input"
    autoload :HiddenInput,         "formtastic-bootstrap/inputs/hidden_input"
    autoload :NumberInput,         "formtastic-bootstrap/inputs/number_input"
    # autoload :NumericInput       # TODO Where does Formtastic actually define this?
    autoload :PasswordInput,       "formtastic-bootstrap/inputs/password_input"
    autoload :PhoneInput,          "formtastic-bootstrap/inputs/phone_input"
    autoload :RadioInput,          "formtastic-bootstrap/inputs/radio_input"
    autoload :RangeInput,          "formtastic-bootstrap/inputs/range_input"
    autoload :SearchInput,         "formtastic-bootstrap/inputs/search_input"
    autoload :SelectInput,         "formtastic-bootstrap/inputs/select_input"
    autoload :StringInput,         "formtastic-bootstrap/inputs/string_input"
    autoload :TextInput,           "formtastic-bootstrap/inputs/text_input"
    autoload :TimeInput,           "formtastic-bootstrap/inputs/time_input"
    # autoload :TimePickerInput    # TODO Come back to this.
    autoload :TimeSelectInput,     "formtastic-bootstrap/inputs/time_select_input"
    autoload :TimeZoneInput,       "formtastic-bootstrap/inputs/time_zone_input"
    # autoload :Timeish            # This seems like a mistake.
    autoload :UrlInput,            "formtastic-bootstrap/inputs/url_input"

  end
end

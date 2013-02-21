module FormtasticBootstrap
  module Inputs
    class DatePickerInput < Formtastic::Inputs::DatePickerInput
      include Base
      include Base::Stringish
      include Base::DatetimePickerish
    end
  end
end
module FormtasticBootstrap
  module Inputs
    class DatetimeSelectInput < Formtastic::Inputs::DatetimeSelectInput
      include Base
      include Base::Timeish
    end
  end
end
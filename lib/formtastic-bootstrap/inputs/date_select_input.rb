module FormtasticBootstrap
  module Inputs
    class DateSelectInput < Formtastic::Inputs::DateSelectInput
      FRAGMENT_CLASSES = {
        :year   => "col-xs-4",
        :month  => "col-xs-5",
        :day    => "col-xs-3"
      }

      include Base
      include Base::Timeish
    end
  end
end

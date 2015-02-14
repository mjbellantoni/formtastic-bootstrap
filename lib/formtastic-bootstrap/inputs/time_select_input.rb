module FormtasticBootstrap
  module Inputs
    class TimeSelectInput < Formtastic::Inputs::TimeSelectInput
      FRAGMENT_CLASSES = {
        :hour    => "col-xs-4",
        :minute  => "col-xs-4",
        :second => "col-xs-4"
      }

      include Base
      include Base::Timeish
    end
  end
end

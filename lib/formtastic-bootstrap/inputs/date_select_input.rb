module FormtasticBootstrap
  module Inputs
    class DateSelectInput < Formtastic::Inputs::DateSelectInput
      include Base
      include Base::Timeish
    end
  end
end
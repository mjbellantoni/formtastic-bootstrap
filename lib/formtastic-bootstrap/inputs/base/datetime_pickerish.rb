module FormtasticBootstrap
  module Inputs
    module Base
      module DatetimePickerish
        include Base::Placeholder
        include Formtastic::Inputs::Base::DatetimePickerish
      end
    end
  end
end
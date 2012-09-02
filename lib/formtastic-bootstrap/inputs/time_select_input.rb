module FormtasticBootstrap
  module Inputs
    class TimeSelectInput < Formtastic::Inputs::TimeSelectInput
      include Base
      include Base::Timeish
    end
  end
end

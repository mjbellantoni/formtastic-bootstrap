module FormtasticBootstrap
  module Inputs
    class RangeInput < Formtastic::Inputs::RangeInput
      include Base
      include Base::Stringish
    end
  end
end
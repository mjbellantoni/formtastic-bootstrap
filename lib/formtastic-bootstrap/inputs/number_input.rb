module FormtasticBootstrap
  module Inputs
    class NumberInput < Formtastic::Inputs::NumberInput
      include Base
      include Base::Stringish
    end
  end
end
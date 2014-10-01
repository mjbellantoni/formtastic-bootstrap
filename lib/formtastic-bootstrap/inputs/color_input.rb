module FormtasticBootstrap
  module Inputs
    class ColorInput < Formtastic::Inputs::ColorInput
      include Base
      include Base::Stringish
    end
  end
end

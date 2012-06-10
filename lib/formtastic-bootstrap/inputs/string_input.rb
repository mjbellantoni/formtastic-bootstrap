module FormtasticBootstrap
  module Inputs
    class StringInput < Formtastic::Inputs::StringInput
      include Base
      include Base::Stringish
    end
  end
end
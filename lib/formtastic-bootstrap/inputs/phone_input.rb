module FormtasticBootstrap
  module Inputs
    class PhoneInput < Formtastic::Inputs::PhoneInput
      include Base
      include Base::Stringish
    end
  end
end
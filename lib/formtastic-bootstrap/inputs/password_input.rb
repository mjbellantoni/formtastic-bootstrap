module FormtasticBootstrap
  module Inputs
    class PasswordInput < Formtastic::Inputs::PasswordInput
      include Base
      include Base::Stringish
    end
  end
end
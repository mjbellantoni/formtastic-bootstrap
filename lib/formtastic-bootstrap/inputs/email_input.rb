module FormtasticBootstrap
  module Inputs
    class EmailInput < Formtastic::Inputs::EmailInput
      include Base
      include Base::Stringish
    end
  end
end
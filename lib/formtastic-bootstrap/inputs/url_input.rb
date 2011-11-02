module FormtasticBootstrap
  module Inputs
    class UrlInput < Formtastic::Inputs::UrlInput
      include Base
      include Base::Stringish
    end
  end
end
module FormtasticBootstrap
  module Inputs
    class SearchInput < Formtastic::Inputs::SearchInput
      include Base
      include Base::Stringish
    end
  end
end
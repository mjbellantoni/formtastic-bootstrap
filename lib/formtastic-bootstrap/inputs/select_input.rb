module FormtasticBootstrap
  module Inputs
    class SelectInput < Formtastic::Inputs::SelectInput
      include Base
      # include Base::Collections
      # include Base::GroupedCollections
    end
  end
end
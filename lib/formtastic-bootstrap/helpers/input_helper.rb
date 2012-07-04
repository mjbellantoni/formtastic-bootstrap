module FormtasticBootstrap
  module Helpers
    module InputHelper
      include Formtastic::Helpers::InputHelper

      def standard_input_class_name(as)
        full_name = "FormtasticBootstrap::Inputs::#{as.to_s.camelize}Input"
        if FormtasticBootstrap::Inputs.const_defined? custom_input_class_name(as).to_sym
          full_name
        else
          super as
        end
      end

    end
  end
end
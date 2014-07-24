module FormtasticBootstrap
  module Helpers
    module InputHelper
      include Formtastic::Helpers::InputHelper

      def input_class_with_const_defined(as)
        input_class_name = custom_input_class_name(as)

        if ::Object.const_defined?(input_class_name)
          input_class_name.constantize
        elsif FormtasticBootstrap::Inputs.const_defined?(input_class_name)
          standard_input_class_name(as).constantize
        else
          raise Formtastic::UnknownInputError, "Unable to find input class #{input_class_name}"
        end
      end

      def standard_input_class_name(as)
        "FormtasticBootstrap::Inputs::#{as.to_s.camelize}Input"
      end

    end
  end
end

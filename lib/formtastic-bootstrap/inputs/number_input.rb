module FormtasticBootstrap
  module Inputs
    class NumberInput < Formtastic::Inputs::NumberInput
      include Base
      include Base::Numeric

      def to_html
        bootstrap_wrapping do
          builder.number_field(method, form_control_input_html_options)
        end
      end

    end
  end
end

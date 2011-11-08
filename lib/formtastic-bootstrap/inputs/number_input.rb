module FormtasticBootstrap
  module Inputs
    class NumberInput < Formtastic::Inputs::NumberInput
      include Base
      include Base::Stringish

      def to_html
        generic_input_wrapping do
          builder.number_field(method, input_html_options)
        end
      end

    end
  end
end
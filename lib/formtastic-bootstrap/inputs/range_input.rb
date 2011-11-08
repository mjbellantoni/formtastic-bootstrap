module FormtasticBootstrap
  module Inputs
    class RangeInput < Formtastic::Inputs::RangeInput
      include Base
      include Base::Stringish

      def to_html
        generic_input_wrapping do
          builder.range_field(method, input_html_options)
        end
      end

    end
  end
end
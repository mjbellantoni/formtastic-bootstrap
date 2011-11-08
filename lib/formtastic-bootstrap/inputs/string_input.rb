module FormtasticBootstrap
  module Inputs
    class StringInput < Formtastic::Inputs::StringInput
      include Base
      include Base::Stringish

      def to_html
        generic_input_wrapping do
          builder.text_field(method, input_html_options)
        end
      end

    end
  end
end
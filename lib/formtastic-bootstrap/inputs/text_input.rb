module FormtasticBootstrap
  module Inputs
    class TextInput < Formtastic::Inputs::TextInput
      include Base 

      def to_html
        generic_input_wrapping do
          builder.text_area(method, input_html_options)
        end
      end

    end
  end
end
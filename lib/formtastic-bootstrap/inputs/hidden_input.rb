module FormtasticBootstrap
  module Inputs
    class HiddenInput < Formtastic::Inputs::HiddenInput
      include Base
      def to_html
        generic_input_wrapping do
          builder.hidden_field(method, input_html_options)
        end
      end
    end
  end
end
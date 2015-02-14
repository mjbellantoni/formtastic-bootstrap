module FormtasticBootstrap
  module Inputs
    class ColorInput < Formtastic::Inputs::ColorInput
      include Base
      include Base::Stringish

      def to_html
        raise "The :color input requires the color_field form helper, which is only available in Rails 4+" unless builder.respond_to?(:color_field)
        bootstrap_wrapping do
          builder.color_field(method, form_control_input_html_options)
        end
      end
    end
  end
end

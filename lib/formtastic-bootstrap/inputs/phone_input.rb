module FormtasticBootstrap
  module Inputs
    class PhoneInput < Formtastic::Inputs::PhoneInput
      include Base
      include Base::Stringish

      def to_html
        generic_input_wrapping do
          builder.phone_field(method, input_html_options)
        end
      end

    end
  end
end
module FormtasticBootstrap
  module Inputs
    class PasswordInput < Formtastic::Inputs::PasswordInput
      include Base
      include Base::Stringish

      def to_html
        generic_input_wrapping do
          builder.password_field(method, input_html_options)
        end
      end

    end
  end
end
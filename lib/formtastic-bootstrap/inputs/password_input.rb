module FormtasticBootstrap
  module Inputs
    class PasswordInput < Formtastic::Inputs::PasswordInput
      include Base
      include Base::Stringish

      def to_html
        bootstrap_wrapping do
          builder.password_field(method, form_control_input_html_options)
        end
      end

    end
  end
end
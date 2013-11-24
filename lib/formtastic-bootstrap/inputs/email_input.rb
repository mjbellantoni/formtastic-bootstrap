module FormtasticBootstrap
  module Inputs
    class EmailInput < Formtastic::Inputs::EmailInput
      include Base
      include Base::Stringish

      def to_html
        bootstrap_wrapping do
          builder.email_field(method, form_control_input_html_options)
        end
      end

    end
  end
end
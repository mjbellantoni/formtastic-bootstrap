module FormtasticBootstrap
  module Inputs
    module Base
      module Stringish

        include Formtastic::Inputs::Base::Stringish

        def to_html
          bootstrap_wrapping do
            builder.text_field(method, form_control_input_html_options)
          end
        end

      end
    end
  end
end

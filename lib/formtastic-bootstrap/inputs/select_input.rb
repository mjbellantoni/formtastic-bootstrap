module FormtasticBootstrap
  module Inputs
    class SelectInput < Formtastic::Inputs::SelectInput

      include Base
      include Base::Collections

      def to_html
        bootstrap_wrapping do
          builder.select(input_name, collection, input_options, form_control_input_html_options)
        end
      end

    end
  end
end

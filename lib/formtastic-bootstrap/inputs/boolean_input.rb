# TODO See if this can be refactored to make use of some of the Choices code.
module FormtasticBootstrap
  module Inputs
    class BooleanInput < Formtastic::Inputs::BooleanInput
      include Base      
      
      def to_html
        control_group_wrapping do
          control_label_html <<
          hidden_field_html <<
          controls_wrapping do
            label_with_nested_checkbox
          end
        end
      end

      def label_with_nested_checkbox
        builder.label(
          method,
          label_text_with_embedded_checkbox,
          label_html_options.tap do |options|
            options[:class] << "checkbox"
          end
        )
      end

    end
  end
end
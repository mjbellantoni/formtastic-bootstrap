# TODO See if this can be refactored to make use of some of the Choices code.
module FormtasticBootstrap
  module Inputs
    class BooleanInput < Formtastic::Inputs::BooleanInput
      include Base

      def to_html
        control_group_div_wrapping do
          empty_label <<
          hidden_field_html <<
          input_div_wrapping(:block) do
            label_with_nested_checkbox
          end
        end
      end

      def label_html_options
        new_class = [super[:class], "checkbox"].compact.join(" ")
        super.merge(:class => new_class)
      end

      # Need this for formatting to work.
      def empty_label
        template.content_tag(:label, '', :class => 'control-label') do end
      end

    end
  end
end

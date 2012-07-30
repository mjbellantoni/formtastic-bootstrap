# TODO See if this can be refactored to make use of some of the Choices code.
module Crowdtastic
  module Inputs
    class BooleanInput < Formtastic::Inputs::BooleanInput
      include Base

      def to_html
        empty_label <<
        hidden_field_html <<
        input_div_wrapping(:block) do
          label_with_nested_checkbox
        end
      end

      def label_text_with_embedded_checkbox
        # That newline matters!  Why, I do no not know.
        check_box_html << "\n" << label_text
      end

      # Need this for formatting to work.
      def empty_label
        template.content_tag(:label) do end
      end

    end
  end
end
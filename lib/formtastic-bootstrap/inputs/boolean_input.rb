module FormtasticBootstrap
  module Inputs
    class BooleanInput < Formtastic::Inputs::BooleanInput
      include Base

      def to_html
        input_wrapping do
          empty_label <<
          hidden_field_html <<
          template.content_tag(:div, :class => "input") do
            template.content_tag(:ul, :class => "inputs-list") do
              template.content_tag(:li) do
                label_with_nested_checkbox
              end
            end
          end
        end
      end

      def label_text_with_embedded_checkbox
        # That newline matters!  Why, I do no not know.
        check_box_html << "\n" << template.content_tag(:span) do label_text end
      end

      # Need this for formatting to work.
      def empty_label
        template.content_tag(:label) do end
      end

    end
  end
end
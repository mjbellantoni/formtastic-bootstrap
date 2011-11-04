module FormtasticBootstrap
  module Inputs
    class CheckBoxesInput < Formtastic::Inputs::CheckBoxesInput
      include Base
      include Base::Choices

      def to_html
        input_wrapping do
          legend_html <<
          hidden_field_for_all <<
          choices_wrapping do
            choices_group_wrapping do
              collection.map { |choice|
                choice_wrapping(choice_wrapping_html_options(choice)) do
                  choice_html(choice)
                end
              }.join("\n").html_safe
            end
          end
        end
      end

      def choice_html(choice)
        template.content_tag(:label,
          hidden_fields? ?
            check_box_with_hidden_input(choice) :
            check_box_without_hidden_input(choice) <<
          choice_label(choice),
          label_html_options.merge(:for => choice_input_dom_id(choice), :class => nil)
        )
      end

    end
  end
end

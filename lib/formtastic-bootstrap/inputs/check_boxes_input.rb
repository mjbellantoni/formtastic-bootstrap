module FormtasticBootstrap
  module Inputs
    class CheckBoxesInput < Formtastic::Inputs::CheckBoxesInput
      include Base
      include Base::Choices

      # TODO Make sure help blocks work correctly.
      # TODO Support .inline

      def to_html
        control_group_wrapping do
          control_label_html <<
          hidden_field_for_all <<
          controls_wrapping do
            collection.map { |choice|
              choice_html(choice)
            }.join("\n").html_safe
          end
        end
      end

      def choice_wrapping_html_options(choice)
        super(choice).tap do |options|
          options[:class] = ((options[:class].split) << "checkbox").join(" ")
        end
      end

      def choice_html(choice)
        template.content_tag(:label,
          hidden_fields? ?
            check_box_with_hidden_input(choice) :
            check_box_without_hidden_input(choice) <<
          choice_label(choice),
          label_html_options.merge(choice_label_html_options(choice))
        )
      end

    end
  end
end

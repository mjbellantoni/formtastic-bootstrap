module FormtasticBootstrap
  module Inputs
    class CheckBoxesInput < Formtastic::Inputs::CheckBoxesInput
      include Base
      include Base::Choices

      # TODO Make sure help blocks work correctly.

      def to_html
        bootstrap_wrapping do
          hidden_field_for_all << # Might need to remove this guy.
          collection.map { |choice|
            choice_html(choice)
          }.join("\n").html_safe
        end
      end

      def choice_html(choice)
        checkbox_wrapping do
          template.content_tag(:label,
            hidden_fields? ?
              check_box_with_hidden_input(choice) :
              check_box_without_hidden_input(choice) <<
            choice_label(choice),
            label_html_options.merge(choice_label_html_options(choice))
          )
        end
      end

      def checkbox_wrapping(&block)
        class_name = "checkbox"
        class_name += " checkbox-inline" if options[:inline]
        template.content_tag(:div,
          template.capture(&block).html_safe,
          :class => class_name
        )
      end

    end
  end
end

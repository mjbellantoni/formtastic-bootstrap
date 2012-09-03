module FormtasticBootstrap
  module Inputs
    class RadioInput < Formtastic::Inputs::RadioInput
      include Base
      include Base::Choices

      # TODO Make sure help blocks work correctly.
      # TODO Support .inline

      def to_html
        control_group_wrapping do
          control_label_html <<
          controls_wrapping do
            collection.map { |choice|
              choice_html(choice)
            }.join("\n").html_safe
          end
        end
      end

      def wrapper_html_options
        # Formtastic marks these as 'radio' but Bootstrap does something
        # with that, so change it to 'radio_buttons'.
        super.tap do |options|
          options[:class] = options[:class].gsub("radio", "radio_buttons")
        end
      end

      # This came from check_boxes.  Do needed refactoring.
      def choice_wrapping_html_options(choice)
        super(choice).tap do |options|
          options[:class] = ((options[:class].split) << "radio").join(" ")
        end
      end

      def choice_html(choice)        
        template.content_tag(:label,
          builder.radio_button(input_name, choice_value(choice), input_html_options.merge(choice_html_options(choice)).merge(:required => false)) << 
          choice_label(choice),
          label_html_options.merge(choice_label_html_options(choice))
        )
      end
      
    end
  end
end
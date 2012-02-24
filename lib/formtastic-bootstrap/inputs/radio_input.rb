module FormtasticBootstrap
  module Inputs
    class RadioInput < Formtastic::Inputs::RadioInput
      include Base
      include Base::Choices

      def to_html
        control_group_div_wrapping do
          legend_html <<
          input_div_wrapping do
            collection.map { |choice|
              choice_html(choice)
            }.join("\n").html_safe
          end
        end
      end

      def choice_html(choice)
        template.content_tag(:label, label_html_options.merge(:for => choice_input_dom_id(choice)).merge(choice_wrapping_html_options(choice))) do
          builder.radio_button(input_name, choice_value(choice), input_html_options.merge(choice_html_options(choice)).merge(:required => false)) <<

          choice_label(choice)
        end
      end

      def choice_wrapping_html_options(choice)
        new_class = [super[:class], 'radio'].join(' ')
        super.merge(:class => new_class)
      end

    end
  end
end

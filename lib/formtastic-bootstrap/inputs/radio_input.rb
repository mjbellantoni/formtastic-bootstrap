module FormtasticBootstrap
  module Inputs
    class RadioInput < Formtastic::Inputs::RadioInput
      include Base

      def to_html
        input_wrapping do
          legend_html <<
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

      ####################
      # Below is stuff derived from "choices.rb"
      # Create that file if there's enough schtuff.
      #
      def choices_wrapping(&block)
        template.content_tag(:div, choices_wrapping_html_options) do
          template.capture(&block)
        end
      end

      def choices_wrapping_html_options
        # Call the Formtastic one explicity and append?
        { :class => "choices input" }
      end

      def choices_group_wrapping(&block)
        template.content_tag(:ul,
          template.capture(&block),
          choices_group_wrapping_html_options
        )
      end

      def choices_group_wrapping_html_options
        { :class => "choices-group inputs-list" }
      end

      def choice_html(choice)        
        template.content_tag(:label, label_html_options.merge(:for => choice_input_dom_id(choice), :class => nil)) do
          builder.radio_button(input_name, choice_value(choice), input_html_options.merge(choice_html_options(choice)).merge(:required => false)) << 
          
          choice_label(choice)
        end
      end

      def choice_label(choice)
        "\n".html_safe + template.content_tag(:span) do
          # (choice.is_a?(Array) ? choice.first : choice).to_s
          (choice.is_a?(Array) ? choice.first : choice).to_s
        end
      end

      # This is actually a label in Bootstrap.
      def legend_html
        template.content_tag(:label, label_html_options) do
          render_label? ? label_text : "".html_safe
        end
      end
      
      def label_html_options
        super.merge(:for => nil)
      end

    end
  end
end
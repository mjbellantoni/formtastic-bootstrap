module FormtasticBootstrap
  module Inputs
    class RadioInput < Formtastic::Inputs::RadioInput
      include Base
      include Base::Choices

      # 

      # TODO Make sure help blocks work correctly.
      # TODO Support .inline

      # def to_html
      #   control_group_wrapping do
      #     control_label_html <<
      #     controls_wrapping do
      #       choices_group_wrapping do
      #         collection.map { |choice| 
      #           choice_wrapping(choice_wrapping_html_options(choice)) do
      #             choice_html(choice)
      #           end
      #         }.join("\n").html_safe
      #       end
      #     end
      #   end

        # CHECKBOXES FROM THIS VERSION OF FB
        def to_html
          control_group_wrapping do
            control_label_html <<
            # hidden_field_for_all <<
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

        # FROM LAST VERSION OF FB
        # bootstrap_vertical_form_input_wrapping do
        #   legend_html <<
        #   input_div_wrapping do
        #     choices_group_wrapping do
        #       collection.map { |choice| 
        #         choice_wrapping(choice_wrapping_html_options(choice)) do
        #           choice_html(choice)
        #         end
        #       }.join("\n").html_safe
        #     end
        #   end
        # end
      # end

      # This came from check_boxes.  Do needed refactoring.
      def choice_wrapping_html_options(choice)
        super(choice).tap do |options|
          options[:class] = ((options[:class].split) << "radio").join(" ")
          options[:for]   = choice_input_dom_id(choice)
        end
      end

      # This came from check_boxes.  Do needed refactoring.
      def choice_label_html_options(choice)
        choice_wrapping_html_options(choice)
      end

      # From FB1.x
      # def choice_html(choice)        
      #   template.content_tag(:label, label_html_options.merge(:for => choice_input_dom_id(choice), :class => nil)) do
      #     builder.radio_button(input_name, choice_value(choice), input_html_options.merge(choice_html_options(choice)).merge(:required => false)) << 
      # 
      #     choice_label(choice)
      #   end
      # end


      # FROM F2.2
      def choice_html(choice)        
        template.content_tag(:label,
          builder.radio_button(input_name, choice_value(choice), input_html_options.merge(choice_html_options(choice)).merge(:required => false)) << 
          choice_label(choice),
          # label_html_options.merge(:for => choice_input_dom_id(choice), :class => nil)
          label_html_options.merge(choice_label_html_options(choice))
        )
      end
      
      # Override to remove the for attribute since this isn't associated with any element, as it's
      # nested inside the legend.
      def label_html_options
        super.merge(:for => nil)
      end



    end
  end
end
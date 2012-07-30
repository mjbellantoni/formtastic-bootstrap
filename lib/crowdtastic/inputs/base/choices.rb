module Crowdtastic
  module Inputs
    module Base
      module Choices

        def input_div_wrapping(&block)
          template.content_tag(:div, choices_wrapping_html_options) do
            [yield, error_html(:block), hint_html(:block)].join("\n").html_safe  
          end
        end

        def choices_wrapping_html_options
          # TODO Call the Formtastic one explicity and append?
          { :class => "choices input" }
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
end
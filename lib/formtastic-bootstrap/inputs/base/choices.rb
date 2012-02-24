module FormtasticBootstrap
  module Inputs
    module Base
      module Choices

        def input_div_wrapping(&block)
          template.content_tag(:div, choices_wrapping_html_options) do
            [yield, error_html(:block), hint_html(:block)].join("\n").html_safe
          end
        end

        def choices_wrapping_html_options
          new_class = [super[:class], "controls"].compact.join(" ")
          super.merge(:class => new_class)
        end

        #def choices_group_wrapping(&block)
        #  template.content_tag(:ul,
        #    template.capture(&block),
        #    choices_group_wrapping_html_options
        #  )
        #end

        # This is actually a label in Bootstrap.
        def legend_html
          template.content_tag(:label, control_label_html_options) do
            render_label? ? label_text : "".html_safe
          end
        end

        def control_label_html_options
          super.merge(:for => nil)
        end

      end
    end
  end
end

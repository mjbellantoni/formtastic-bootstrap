module FormtasticBootstrap
  module Inputs
    module Base
      module Wrapping

        include Formtastic::Inputs::Base::Wrapping

        def bootstrap_wrapping(&block)
          control_group_wrapping do
            control_label_html <<
            controls_wrapping do
              if options[:prepend]
                prepended_input_wrapping do
                  [template.content_tag(:span, options[:prepend], :class => 'add-on'), yield, hint_html].join("\n").html_safe
                end
              else
                [yield, hint_html].join("\n").html_safe
              end
            end
          end
        end

        def control_group_wrapping(&block)
          template.content_tag(:div, 
          [template.capture(&block), error_html].join("\n").html_safe, 
            wrapper_html_options
          )
        end

        def controls_wrapping(&block)
          template.content_tag(:div, template.capture(&block).html_safe, controls_wrapper_html_options)
        end
        
        def controls_wrapper_html_options
          {
            :class => "controls"
          }
        end

        def wrapper_html_options
          super.tap do |options|
            options[:class] << " control-group"
          end
        end
        
        # Bootstrap prepend feature
        def prepended_input_wrapping(&block)
          template.content_tag(:div, :class => 'input-prepend') do
            yield
          end
        end
      end
    end
  end
end
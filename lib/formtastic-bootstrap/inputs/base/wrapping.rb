module FormtasticBootstrap
  module Inputs
    module Base
      module Wrapping

        include Formtastic::Inputs::Base::Wrapping

        def bootstrap_wrapping(&block)
          control_group_wrapping do
            control_label_html <<
            controls_wrapping do
              if options[:prepend] || options[:append]
                if options[:prepend] && options[:append]
                  prepended_and_appended_input_wrapping do
                    [template.content_tag(:span, options[:prepend], :class => 'add-on'), yield, template.content_tag(:span, options[:append], :class => 'add-on'), hint_html].join("\n").html_safe
                  end
                elsif options[:prepend]
                  prepended_input_wrapping do
                    [template.content_tag(:span, options[:prepend], :class => 'add-on'), yield, hint_html].join("\n").html_safe
                  end
                elsif options[:append]
                  appended_input_wrapping do
                    [yield, template.content_tag(:span, options[:append], :class => 'add-on'), hint_html].join("\n").html_safe
                  end
                end
              else
                [yield, hint_html].join("\n").html_safe
              end
            end
          end
        end

        def control_group_wrapping(&block)
          template.content_tag(:div, 
            template.capture(&block).html_safe, 
            wrapper_html_options
          )
        end

        def controls_wrapping(&block)
          template.content_tag(:div,
            [template.capture(&block), error_html].join("\n").html_safe,
            controls_wrapper_html_options
          )
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

        # Bootstrap append feature
        def appended_input_wrapping(&block)
          template.content_tag(:div, :class => 'input-append') do
            yield
          end
        end

        # Bootstrap prepend and append feature
        def prepended_and_appended_input_wrapping(&block)
          template.content_tag(:div, :class => 'input-prepend input-append') do
            yield
          end
        end

      end
    end
  end
end

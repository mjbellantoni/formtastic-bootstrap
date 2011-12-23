module FormtasticBootstrap
  module Inputs
    module Base
      module Wrapping

        include Formtastic::Inputs::Base::Wrapping

        def generic_input_wrapping(&block)
          clearfix_div_wrapping do
            label_html <<
            input_div_wrapping do
              if options[:prepend]
                prepended_input_wrapping do
                  [template.content_tag(:span, options[:prepend], :class => 'add-on'), yield].join("\n").html_safe
                end
              else
                yield
              end
            end
          end
        end

        def clearfix_div_wrapping(&block)
          template.content_tag(:div, wrapper_html_options) do
            yield
          end
        end

        def input_div_wrapping(inline_or_block_errors = :inline)
          template.content_tag(:div, :class => "input") do 
            [yield, error_html(inline_or_block_errors), hint_html(inline_or_block_errors)].join("\n").html_safe  
          end
        end

        def inline_inputs_div_wrapping(&block)
          template.content_tag(:div, :class => "inline-inputs") do
            yield
          end
        end

        def wrapper_html_options
          opts = options[:wrapper_html] || {}
          opts[:class] ||= []
          opts[:class] = [opts[:class].to_s] unless opts[:class].is_a?(Array)
          opts[:class] << as
          opts[:class] << "clearfix"
          # opts[:class] << "input"
          opts[:class] << "error" if errors?
          opts[:class] << "optional" if optional?
          opts[:class] << "required" if required?
          opts[:class] << "autofocus" if autofocus?
          opts[:class] = opts[:class].join(' ')
        
          opts[:id] ||= wrapper_dom_id
      
          opts
        end
        
        def prepended_input_wrapping(&block)
          template.content_tag(:div, :class => 'input-prepend') do
            yield
          end
        end
      end
    end
  end
end
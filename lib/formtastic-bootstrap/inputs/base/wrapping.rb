module FormtasticBootstrap
  module Inputs
    module Base
      module Wrapping

        include Formtastic::Inputs::Base::Wrapping

        def input_wrapping(&block)
          template.content_tag(:div, wrapper_html_options) do
            [template.capture(&block), error_html, hint_html].join("\n").html_safe, 
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

      end
    end
  end
end
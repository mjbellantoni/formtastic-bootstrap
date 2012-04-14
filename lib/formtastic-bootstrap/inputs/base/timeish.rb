module FormtasticBootstrap
  module Inputs
    module Base
      module Timeish

        def date_input_html
          fragment_input_html(:date, "small")
        end

        def time_input_html
          fragment_input_html(:time, "mini")
        end
        
        def fragment_id(fragment)
          # TODO is this right?
          # "#{input_html_options[:id]}_#{position(fragment)}i"
          "#{input_html_options[:id]}[#{fragment}]"
        end
        
        def fragment_input_html(fragment, klass)
          opts = input_options.merge(:prefix => object_name, :field_name => fragment_name(fragment), :default => value, :include_blank => include_blank?)
          template.send(:"text_field_#{fragment}", value, opts, input_html_options.merge(:id => fragment_id(fragment), :class => klass))
        end
     
      end
    end
  end
end

module FormtasticBootstrap
  module Inputs
    module Base
      module Timeish

        def to_html
          control_group_wrapping do
            control_label_html <<
            controls_wrapping do
              hidden_fragments <<
              fragments.map do |fragment|
                fragment_input_html(fragment)
              end.join.html_safe
            end
          end
        end

        def controls_wrapper_html_options
          super.tap do |options|
            options[:class] = (options[:class].split << "controls-row").join(" ")
          end
        end

        def fragment_input_html(fragment)
          opts = input_options.merge(:prefix => fragment_prefix, :field_name => fragment_name(fragment), :default => value, :include_blank => include_blank?)
          template.send(:"select_#{fragment}", value, opts, fragment_input_html_options(fragment))
        end

        def fragment_input_html_options(fragment)
          input_html_options.tap do |options|
            options[:id] = fragment_id(fragment)
            options[:class] = ((options[:class] || "").split << fragment_class(fragment)).join(" ")
            options[:placeholder] = fragment_placeholder(fragment)
          end
        end

        def fragment_class(fragment) 
          { 
            :year   => "span1", 
            :month  => "span2",
            :day    => "span1",
            :hour   => "span1",
            :minute => "span1",
            :second => "span1"
          }[fragment]
        end

        def fragment_placeholder(fragment)
          "." + fragment_class(fragment) 
        end

      end
    end
  end
end
module FormtasticBootstrap
  module Inputs
    module Base
      module Timeish

        def to_html
          form_group_wrapping do
            label_html <<
            hidden_fragments <<
            form_control_row_wrapping do
              fragments.map do |fragment|
                fragment_input_html(fragment.to_sym)
              end.join.html_safe
            end
          end
        end

        def form_control_row_wrapping(&block)
          template.content_tag(:div,
            template.capture(&block).html_safe,
            form_control_row_wrapper_html_options
          )
        end

        def form_control_row_wrapper_html_options
          { :class => "form-control" }
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
            :year   => "col-xs-1",
            :month  => "col-xs-2",
            :day    => "col-xs-1",
            :hour   => "col-xs-1",
            :minute => "col-xs-1",
            :second => "col-xs-1"
          }[fragment]
        end

        def fragment_placeholder(fragment)
          # TODO This sets a useless placeholer right now.
          "." + fragment_class(fragment)
        end

      end
    end
  end
end

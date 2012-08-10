module FormtasticBootstrap
  module Inputs
    module Base
      module Timeish

        def date_input_html
          fragment_input_html(:date, "small")

        end

        def time_input_html
          default_date_fragments.map do |fragment|
            fragment_input_html(:time, "mini")
          end.join.html_safe
        end

        def fragment_input_html(fragment, klass)
          opts = input_options.merge(:prefix => fragment_prefix, :field_name => fragment_name(fragment), :default => value, :include_blank => include_blank?)
          template.send(:"select_#{fragment}", value, opts, input_html_options.merge(:id => fragment_id(fragment), :class => klass))
        end

      end
    end
  end
end

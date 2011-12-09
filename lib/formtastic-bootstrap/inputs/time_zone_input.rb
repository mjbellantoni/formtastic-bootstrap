module FormtasticBootstrap
  module Inputs
    class TimeZoneInput < Formtastic::Inputs::TimeZoneInput
      include Base

      def to_html
        generic_input_wrapping do
          builder.time_zone_select(method, priority_zones, input_options, input_html_options)
        end
      end

    end
  end
end

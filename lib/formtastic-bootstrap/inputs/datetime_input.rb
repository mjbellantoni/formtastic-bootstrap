module FormtasticBootstrap
  module Inputs
    class DatetimeInput < Formtastic::Inputs::DatetimeInput
      include Base
      include Base::Stringish
      include Base::Timeish

      def to_html
        generic_input_wrapping do
          inline_inputs_div_wrapping do
            # This newline matters.
            date_input_html << "\n".html_safe << time_input_html
          end
        end
      end

    end
  end
end
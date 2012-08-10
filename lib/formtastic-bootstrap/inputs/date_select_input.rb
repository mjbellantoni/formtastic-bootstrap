module FormtasticBootstrap
  module Inputs
    # Outputs a series of select boxes for the fragments that make up a date (year, month, day).
    #
    # @see Formtastic::Inputs::Base::Timeish Timeish module for documentation of date, time and datetime input options.
    class DateSelectInput < Formtastic::Inputs::DateInput
      include Base
      include Base::Stringish
      include Base::Timeish

      def to_html
        generic_input_wrapping do
          date_input_html
        end
      end
    end
  end
end
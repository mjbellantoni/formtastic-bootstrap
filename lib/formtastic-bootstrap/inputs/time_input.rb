module FormtasticBootstrap
  module Inputs
    class TimeInput < Formtastic::Inputs::TimeInput
      include Base
      include Base::Stringish
      include Base::Timeish

      def to_html
        input_wrapping do
          label_html <<
          bootstrap_input_wrapping do
            time_input_html
          end
        end
      end
    end
  end
end
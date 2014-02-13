module FormtasticBootstrap
  module Inputs
    class CountryInput < Formtastic::Inputs::CountryInput
      include Base

      def to_html
        bootstrap_wrapping do
          builder.country_select(method, priority_countries, input_options, form_control_input_html_options)
        end
      end

    end
  end
end

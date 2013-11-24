module FormtasticBootstrap
  module Inputs
    class SearchInput < Formtastic::Inputs::SearchInput
      include Base
      include Base::Stringish

      def to_html
        bootstrap_wrapping do
          builder.search_field(method, form_control_input_html_options)
        end
      end

    end
  end
end
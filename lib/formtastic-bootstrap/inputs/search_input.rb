module FormtasticBootstrap
  module Inputs
    class SearchInput < Formtastic::Inputs::SearchInput
      include Base
      include Base::Stringish

      def to_html
        generic_input_wrapping do
          builder.search_field(method, input_html_options)
        end
      end

    end
  end
end
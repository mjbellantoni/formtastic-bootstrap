module FormtasticBootstrap
  module Inputs
    class SelectInput < Formtastic::Inputs::SelectInput
      include Base

      def to_html
        generic_input_wrapping do
          options[:group_by] ? grouped_select_html : select_html
        end
      end

    end
  end
end
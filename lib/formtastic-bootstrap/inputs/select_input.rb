module FormtasticBootstrap
  module Inputs
    class SelectInput < Formtastic::Inputs::SelectInput
      include Base
      include Base::Collections
      include Base::GroupedCollections

      def select_html
        builder.select(input_name, collection, input_options, form_control_input_html_options)
      end

      def grouped_select_html
        builder.grouped_collection_select(
          input_name,
          grouped_collection,
          group_association,
          group_label_method,
          value_method,
          label_method,
          input_options,
          form_control_input_html_options
        )
      end
      
      def to_html
        bootstrap_wrapping do
          options[:group_by] ? grouped_select_html : select_html
        end
      end

    end
  end
end
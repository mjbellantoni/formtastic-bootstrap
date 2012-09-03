module FormtasticBootstrap
  module Inputs
    class SelectInput < Formtastic::Inputs::SelectInput
      include Base
      include Base::Collections
      include Base::GroupedCollections

      def to_html
        bootstrap_wrapping do
          options[:group_by] ? grouped_select_html : select_html
        end
      end

    end
  end
end
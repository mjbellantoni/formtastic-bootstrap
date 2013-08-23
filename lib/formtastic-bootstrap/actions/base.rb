module FormtasticBootstrap
  module Actions
    module Base

      # Bootstrap doesn't have wrappers.
      def wrapper(&block)
        template.capture(&block)
      end

      # Default button class
      def default_wrapper_classes
        ["btn"]
      end

      # :wrapper_html member :class is prefixed with btn
      # :button_html member :class is all encompassing
      def default_button_html
        {
          :accesskey => accesskey,
          :class => wrapper_class.strip,
          :id => wrapper_id
         }
      end

    end
  end
end

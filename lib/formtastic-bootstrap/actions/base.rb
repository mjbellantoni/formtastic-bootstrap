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

      def extra_button_html_options
        if (button_html_from_options || {}).key?('data-disable-with')
          super
        else
          super.merge('data-disable-with' => disable_text)
        end
      end

      def disable_text
        localized_string(i18n_key, i18n_key, :action_disablers, :model => sanitized_object_name)
      end

    end
  end
end

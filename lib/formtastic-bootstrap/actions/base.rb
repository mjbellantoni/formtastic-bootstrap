module FormtasticBootstrap
  module Actions
    module Base

      # Bootstrap doesn't have wrappers.
      def wrapper(&block)
        # TODO Detect if user passed wrapper_html_options and issue
        #      a warning that they're ignored. (See the original in
        #      Formtastic.)
        template.capture(&block)
      end

      def default_button_html
        { 
          :accesskey => accesskey,
          :class => "btn"
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

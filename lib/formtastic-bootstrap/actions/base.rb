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

    end
  end
end
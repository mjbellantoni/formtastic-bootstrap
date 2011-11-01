module FormtasticBootstrap
  module Inputs
    module Base
      module Hints
        
        include Formtastic::Inputs::Base::Hints

        def hint_html
          if hint?
            template.content_tag(
              :span, 
              Formtastic::Util.html_safe(hint_text), 
              :class => (options[:hint_class] || builder.default_hint_class)
            )
          end
        end

      end
    end
  end
end

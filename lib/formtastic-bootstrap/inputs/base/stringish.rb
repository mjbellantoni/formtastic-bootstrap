# Alas, I need to duplicate code from Formtastic::Inputs::Base::Stringish because
# there's no way to re-import that module.
module FormtasticBootstrap
  module Inputs
    module Base
      module Stringish
        
        include Formtastic::Inputs::Base::Stringish

        def wrapper_html_options
          new_class = [super[:class], "stringish"].compact.join(" ")
          super.merge(:class => new_class)
        end
        
      end
    end
  end
end
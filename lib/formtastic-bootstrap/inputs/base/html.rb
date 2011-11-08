module FormtasticBootstrap
  module Inputs
    module Base
      module Html

        include Formtastic::Inputs::Base::Html

        def input_html_options
          if errors?
            { 
              :class => "error"
            }.merge(super)
          else
            super
          end
        end

      end
    end
  end
end
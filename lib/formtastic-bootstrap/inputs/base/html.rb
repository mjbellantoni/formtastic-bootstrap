module FormtasticBootstrap
  module Inputs
    module Base
      module Html

        include Formtastic::Inputs::Base::Html

        def input_html_options
          opts = {
            :class => "form-control"
          }.merge(super)
          opts[:class] += " error" if errors?

          opts
        end

      end
    end
  end
end

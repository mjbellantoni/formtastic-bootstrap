module FormtasticBootstrap
  module Inputs
    module Base
      module Labelling

        include Formtastic::Inputs::Base::Labelling

        def label_html_options
          super.tap do |options|
            # Bootstrap defines class 'label'
            options[:class] = options[:class].reject { |c| c == 'label' }
            options[:class] << "control-label"
          end
        end
        
      end
    end
  end
end
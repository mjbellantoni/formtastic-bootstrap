module FormtasticBootstrap
  module Inputs
    module Base
      module Labelling

        include Formtastic::Inputs::Base::Labelling

        def label_html_options
          super.tap do |options|
            # Bootstrap defines class 'label'
            options[:class] = options[:class].reject { |c| c == 'label' }
            # options[:class] << "control-label"
          end
        end
        
        def control_label_html_options
          label_html_options.tap do |options|
            options[:class] << "control-label"
          end
        end

        def control_label_html
          render_label? ? builder.label(input_name, label_text, control_label_html_options) : "".html_safe
        end

      end
    end
  end
end
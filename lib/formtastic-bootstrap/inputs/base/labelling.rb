module FormtasticBootstrap
  module Inputs
    module Base
      module Labelling

        include Formtastic::Inputs::Base::Labelling

        def label_html_options
          super.tap do |options|
            # Bootstrap defines class 'label' too, so remove the
            # one that gets created by Formtastic.
            options[:class] = options[:class].reject { |c| c == 'label' }
            options[:class] << " control-label"
          end
        end

        # def control_label_html
        def label_html
          if render_label?
            template.content_tag(:span, :class => 'form-label') do
              builder.label(input_name, label_text, label_html_options)
            end
          else
            "".html_safe
          end
        end

      end
    end
  end
end

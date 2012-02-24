module FormtasticBootstrap
  module Inputs
    module Base
      module Labelling

        include Formtastic::Inputs::Base::Labelling

        def label_html
          render_label? ? builder.label(input_name, label_text, control_label_html_options) : "".html_safe
        end

        def label_html_options
          opts = {}
          opts[:for] ||= input_html_options[:id]
          opts[:class] = [opts[:class]]

          opts
        end

        def control_label_html_options
          new_class = [label_html_options[:class], "control-label"].compact.join(" ")
          label_html_options.merge(:class => new_class)
        end

      end
    end
  end
end

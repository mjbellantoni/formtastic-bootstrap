module FormtasticBootstrap
  module Inputs
    module Base
      module Wrapping

        include Formtastic::Inputs::Base::Wrapping

        def bootstrap_wrapping(&block)
          input_content = [
            add_on_content(options[:prepend]),
            options[:prepend_content],
            yield,
            add_on_content(options[:append]),
            options[:append_content],
            hint_html
          ].compact.join("\n").html_safe

          form_group_wrapping do
            label_html <<
            if prepended_or_appended?(options)
              template.content_tag(:div, :class => add_on_wrapper_classes(options).join(" ")) do
                input_content
              end
            else
              input_content
            end
          end
        end

        def prepended_or_appended?(options)
          options[:prepend] || options[:prepend_content] || options[:append] || options[:append_content]
        end

        def add_on_content(content)
          return nil unless content
          template.content_tag(:span, content, :class => 'add-on')
        end

        def form_group_wrapping(&block)
          template.content_tag(:div,
            template.capture(&block).html_safe,
            wrapper_html_options
          )
        end

        def wrapper_html_options
          super.tap do |options|
            options[:class] << " form-group"
            options[:class] << " has-error" if errors?
          end
        end

        def add_on_wrapper_classes(options)
          [:prepend, :append, :prepend_content, :append_content].map do |key|
            "input-#{key.to_s.gsub('_content', '')}" if options[key]
          end
        end

      end
    end
  end
end

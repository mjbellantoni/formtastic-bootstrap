module FormtasticBootstrap
  module Helpers
    module FieldsetWrapper

      include Formtastic::Helpers::FieldsetWrapper

      protected

      def field_set_and_list_wrapping(*args, &block) #:nodoc:
        contents = args.last.is_a?(::Hash) ? '' : args.pop.flatten
        html_options = args.extract_options!

        if block_given?
          contents = if template.respond_to?(:is_haml?) && template.is_haml?
            template.capture_haml(&block)
          else
            template.capture(&block)
          end
        end

        # Ruby 1.9: String#to_s behavior changed, need to make an explicit join.
        contents = contents.join if contents.respond_to?(:join)

        legend = field_set_legend(html_options)
        fieldset = template.content_tag(:fieldset,
          Formtastic::Util.html_safe(legend) << Formtastic::Util.html_safe(contents),
          html_options.except(:builder, :parent, :name)
        )

        fieldset
      end

    end
  end
end

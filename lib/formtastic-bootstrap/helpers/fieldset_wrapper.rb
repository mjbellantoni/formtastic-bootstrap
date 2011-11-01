module FormtasticBootstrap
  module Helpers
    module FieldsetWrapper

      include Formtastic::Helpers::FieldsetWrapper
      
      protected

      def field_set_and_list_wrapping(*args, &block) #:nodoc:
        contents = args.last.is_a?(::Hash) ? '' : args.pop.flatten
        html_options = args.extract_options!

        legend  = (html_options[:name] || '').to_s
        legend %= parent_child_index(html_options[:parent]) if html_options[:parent]
        legend  = template.content_tag(:legend, Formtastic::Util.html_safe(legend)) unless legend.blank?

        if block_given?
          contents = if template.respond_to?(:is_haml?) && template.is_haml?
            template.capture_haml(&block)
          else
            template.capture(&block)
          end
        end

        # Ruby 1.9: String#to_s behavior changed, need to make an explicit join.
        contents = contents.join if contents.respond_to?(:join)
        fieldset = template.content_tag(:fieldset,
          Formtastic::Util.html_safe(legend) << Formtastic::Util.html_safe(contents),
          html_options.except(:builder, :parent, :name)
        )

        fieldset
      end

    end
  end
end
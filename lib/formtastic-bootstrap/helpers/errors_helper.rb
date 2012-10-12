module FormtasticBootstrap
  module Helpers
    module ErrorsHelper

      include Formtastic::Helpers::ErrorsHelper
      
      def semantic_errors(*args)
        html_options = args.extract_options!
        args = args - [:base]
        full_errors = args.inject([]) do |array, method|
          attribute = localized_string(method, method.to_sym, :label) || humanized_attribute_name(method)
          errors = Array(@object.errors[method.to_sym]).to_sentence
          errors.present? ? array << [attribute, errors].join(" ") : array ||= []
        end
        full_errors << @object.errors[:base]
        full_errors.flatten!
        full_errors.compact!
        return nil if full_errors.blank?
        html_options[:class] ||= "errors"
        template.content_tag(:div, :class => 'alert alert-error alert-block') do
          Formtastic::Util.html_safe( '<button type="button" class="close" data-dismiss="alert">&times;</button>' + "\n") +
          template.content_tag(:ul, html_options) do
            Formtastic::Util.html_safe(full_errors.map { |error| template.content_tag(:li, Formtastic::Util.html_safe(error)) }.join)
          end
        end
      end
      
    end
  end
end
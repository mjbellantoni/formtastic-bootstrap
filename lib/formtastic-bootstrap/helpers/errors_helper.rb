module FormtasticBootstrap
  module Helpers
    module ErrorsHelper
      include Formtastic::Helpers::FileColumnDetection
      include Formtastic::Helpers::Reflection
      include Formtastic::LocalizedString

      INLINE_ERROR_TYPES = [:sentence, :list, :first]

      # Generates a bootstrap error alert element containing
      # an unordered list of error messages on the base object and optionally for a given
      # set of named attribute. This is idea for rendering a block of error messages at the top of
      # the form for hidden/special/virtual attributes (the Paperclip Rails plugin does this), or
      # errors on the base model.
      #
      # A hash can be used as the last set of arguments to pass HTML attributes to the `<ul>`
      # wrapper.
      #
      # @example A list of errors on the base model
      #   <%= semantic_form_for ... %>
      #     <%= f.semantic_errors %>
      #     ...
      #   <% end %>
      #
      # @example A list of errors on the base and named attributes
      #   <%= semantic_form_for ... %>
      #     <%= f.semantic_errors :something_special %>
      #     ...
      #   <% end %>
      #
      # @example A list of errors on the base model, with custom HTML attributes
      #   <%= semantic_form_for ... %>
      #     <%= f.semantic_errors :class => "awesome" %>
      #     ...
      #   <% end %>
      #
      # @example A list of errors on the base model and named attributes, with custom HTML attributes
      #   <%= semantic_form_for ... %>
      #     <%= f.semantic_errors :something_special, :something_else, :class => "awesome", :onclick => "Awesome();" %>
      #     ...
      #   <% end %>
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

        if html_options[:class].blank?
          html_options[:class] = "alert alert-danger"
        else
          html_options[:class] = "alert alert-danger " + html_options[:class]
        end

        template.content_tag(:div, html_options) do
          template.content_tag(:a, "&times;".html_safe, :class => "close", "data-dismiss" => "alert") +
          template.content_tag(:ul, {:class => "error-list"}) do
            Formtastic::Util.html_safe(full_errors.map { |error| template.content_tag(:li, Formtastic::Util.html_safe(error)) }.join)
          end
        end
      end
    end
  end
end

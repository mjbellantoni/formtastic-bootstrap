module FormtasticBootstrap
  module Helpers
    module ActionsHelper

      include Formtastic::Helpers::ActionsHelper
      include FormtasticBootstrap::Helpers::FieldsetWrapper

      def actions(*args, &block)

        html_options = args.extract_options!
        html_options[:class] ||= "form-actions"

        if block_given?
          field_set_and_list_wrapping(html_options, &block)
        else
          args = default_actions if args.empty?
          contents = args.map { |action_name| action(action_name) }
          field_set_and_list_wrapping(html_options, contents)
        end
      end

    end
  end
end

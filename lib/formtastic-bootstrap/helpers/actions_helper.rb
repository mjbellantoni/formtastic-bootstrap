module FormtasticBootstrap
  module Helpers
    module ActionsHelper

      include Formtastic::Helpers::ActionsHelper
      
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
      
      # protected
      # 
      # def default_actions
      #   [:submit]
      # end

    end
  end
end
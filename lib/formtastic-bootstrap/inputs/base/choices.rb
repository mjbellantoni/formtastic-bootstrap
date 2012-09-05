module FormtasticBootstrap
  module Inputs
    module Base
      module Choices
        include Formtastic::Inputs::Base::Choices

        def choice_wrapping_html_options(choice)
          super(choice).tap do |options|
            options[:for]   = choice_input_dom_id(choice)
          end
        end

        def choice_label_html_options(choice)
          choice_wrapping_html_options(choice)
        end

      end
    end
  end
end
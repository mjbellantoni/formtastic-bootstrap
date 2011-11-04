module FormtasticBootstrap
  module Inputs
    class RadioInput < Formtastic::Inputs::RadioInput
      include Base
      include Base::Choices

      def to_html
        input_wrapping do
          legend_html <<
          choices_wrapping do
            choices_group_wrapping do
              collection.map { |choice| 
                choice_wrapping(choice_wrapping_html_options(choice)) do
                  choice_html(choice)
                end
              }.join("\n").html_safe
            end
          end
        end
      end

    end
  end
end
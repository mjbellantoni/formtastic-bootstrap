module FormtasticBootstrap
  module Inputs
    class FileInput < Formtastic::Inputs::FileInput
      include Base

      def to_html
        generic_input_wrapping do
          builder.file_field(method, input_html_options)
        end
      end

    end
  end
end
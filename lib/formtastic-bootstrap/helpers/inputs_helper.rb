module FormtasticBootstrap
  module Helpers
    module InputsHelper
      include FormtasticBootstrap::Helpers::FieldsetWrapper

        def inputs(*args, &block)
          wrap_it = @already_in_an_inputs_block ? true : false
          @already_in_an_inputs_block = true
        
          title = field_set_title_from_args(*args)
          html_options = args.extract_options!
          html_options[:class] ||= "inputs"
          html_options[:name] = title

          out = begin
            if html_options[:for] # Nested form
              inputs_for_nested_attributes(*(args << html_options), &block)
            elsif block_given?
              field_set_and_list_wrapping(*(args << html_options), &block)
            else
              legend = args.shift if args.first.is_a?(::String)
              args = default_columns_for_object if @object && args.empty?
              contents = fieldset_contents_from_column_list(args)
              args.unshift(legend) if legend.present?
              field_set_and_list_wrapping(*((args << html_options) << contents))
            end
          end
        
          # out = template.content_tag(:li, out, :class => "input") if wrap_it
          @already_in_an_inputs_block = false
          out
        end

    end
  end
end
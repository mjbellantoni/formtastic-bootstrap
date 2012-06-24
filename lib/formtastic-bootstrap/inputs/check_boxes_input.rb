module FormtasticBootstrap
  module Inputs
    class CheckBoxesInput < Formtastic::Inputs::CheckBoxesInput
      include Base
      include Base::Choices

      # Twitter Bootstrap Wants
      #
      # <div class="control-group">
      #    <label class="control-label" for="optionsCheckboxList">Checkboxes</label>
      #    <div class="controls">
      #      <label class="checkbox">
      #        <input type="checkbox" name="optionsCheckboxList1" value="option1">
      #        Option one is this and that&mdash;be sure to include why it's great
      #      </label>
      #      <p class="help-block"><strong>Note:</strong> Labels surround all the options for much larger click areas and a more usable form.</p>
      #    </div>
      #  </div>

      # FB Currently Produces
      #
      # <div class="check_boxes input optional control-group" id="form_object_string_two_input">
      #   <label class=" control-label" for="form_object_form_object[string_two][]">Names</label>
      #   <input id="form_object_string_two_none" name="form_object[string_two][]" type="hidden" value="" />
      #   <div class="controls">
      #     <label class="checkbox" for="form_object_string_two_justin">
      #       <input id="form_object_string_two_justin" name="form_object[string_two][]" type="checkbox" value="Justin" />Justin
      #     </label>
      #   </div>
      # </div>

      # TODO
      # . control_group_label isn't creating the correct "for" attribute
      # . hidden inpit "id" and "name" look non-sensical
      # . help-block

      def to_html
        control_group_wrapping do
          control_label_html <<
          hidden_field_for_all <<
          controls_wrapping do
            # choices_group_wrapping do
              collection.map { |choice|
                # choice_wrapping(choice_wrapping_html_options(choice)) do
                  choice_html(choice)
                # end
              }.join("\n").html_safe
            # end
          end
        end
      end

      def choice_html(choice)
        template.content_tag(:label,
          hidden_fields? ?
            check_box_with_hidden_input(choice) :
            check_box_without_hidden_input(choice) <<
          choice_label(choice),
          label_html_options.merge(:for => choice_input_dom_id(choice), :class => "checkbox")
        )
      end

    end
  end
end

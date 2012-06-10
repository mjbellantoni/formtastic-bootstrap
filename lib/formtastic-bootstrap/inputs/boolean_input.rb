# TODO See if this can be refactored to make use of some of the Choices code.
module FormtasticBootstrap
  module Inputs
    class BooleanInput < Formtastic::Inputs::BooleanInput
      include Base

      # <form accept-charset="UTF-8" action="/posts" class="formtastic post" id="new_post" method="post" novalidate="novalidate">
      #   <div style="margin:0;padding:0;display:inline">
      #   <input name="utf8" type="hidden" value="&#x2713;" /></div>
      #   <div class="boolean input optional control-group" id="post_allow_comments_input">
      #     <label class=" control-label" for="post_allow_comments">Allow comments</label>
      #     <input name="post[allow_comments]" type="hidden" value="0" />
      #     <div class="controls">
      #       <label class=" control-label" for="post_allow_comments">
      #         <input checked="checked" id="post_allow_comments" name="post[allow_comments]" type="checkbox" value="1" />Allow comments
      #       </label>
      #     </div>
      #   </div>
      # </form>
      # <form accept-charset="UTF-8" action="/posts" class="formtastic post" id="new_post" method="post" novalidate="novalidate">
      #   <div style="margin:0;padding:0;display:inline">
      #     <input name="utf8" type="hidden" value="&#x2713;" />
      #   </div>
      #   <div class="boolean input optional control-group" id="post_allow_comments_input">
      #     <label class=" control-label" for="post_allow_comments">Allow comments</label>
      #     <input name="post[allow_comments]" type="hidden" value="unchecked" />
      #     <div class="controls">
      #       <label class=" control-label" for="post_allow_comments">
      #         <input checked="checked" id="post_allow_comments" name="post[allow_comments]" type="checkbox" value="checked" />Allow comments
      #       </label>
      #     </div>
      #   </div>
      # </form>



      # <div class="control-group">
      #   <label class="control-label" for="optionsCheckbox2">Disabled checkbox</label>
      #   <div class="controls">
      #     <label class="checkbox">
      #       <input type="checkbox" id="optionsCheckbox2" value="option1" disabled>
      #       This is a disabled checkbox
      #     </label>
      #   </div>
      # </div>
      def to_html
        control_group_wrapping do
          label_html <<
          hidden_field_html <<
          controls_wrapping do
            label_with_nested_checkbox
          end
        end
      end

      # def to_html
      #   bootstrap_vertical_form_input_wrapping do
      #     empty_label <<
      #     hidden_field_html <<
      #     input_div_wrapping(:block) do
      #       template.content_tag(:ul, :class => "inputs-list") do
      #         template.content_tag(:li) do
      #           label_with_nested_checkbox
      #         end
      #       end
      #     end
      #   end
      # end

      # def label_text_with_embedded_checkbox
      #   # That newline matters!  Why, I do no not know.
      #   check_box_html << "\n" << template.content_tag(:span) do label_text end
      # end

      # def empty_label_html
      #   puts "FB::BI#empty_label_html:"
      #   template.content_tag(:label, "HELLO", :class => "control-label ABCDEF")
      # end

      # def label_html_options
      #   op = super.tap do |options|
      #     options[:class] -= ["control-label"]
      #     options[:class] += ["BOOM"]
      #     options[:class] += ["checkbox"]
      #     options[:class] += ["inline"] # TODO Should this be made a parameter?
      #   end
      #   puts "FB::BI#label_html_options: #{op}"
      #   op
      # end

    end
  end
end
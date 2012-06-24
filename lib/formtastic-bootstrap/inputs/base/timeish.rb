module FormtasticBootstrap
  module Inputs
    module Base
      module Timeish

        
        # ORIGINAL FORMTASTIC BOOTSTRAP

        # def label_html
        #   # TODO Supress the "for" field?
        #   template.content_tag(:label, label_html_options) do
        #     render_label? ? label_text : "".html_safe
        #   end
        # end
        # 
        # def date_input_html
        #   fragment_input_html(:date, "small")
        # end
        # 
        # def time_input_html
        #   fragment_input_html(:time, "mini")
        # end
        # 
        # def fragment_id(fragment)
        #   # TODO is this right?
        #   # "#{input_html_options[:id]}_#{position(fragment)}i"
        #   "#{input_html_options[:id]}[#{fragment}]"
        # end
        # 
        # def fragment_input_html(fragment, klass)
        #   opts = input_options.merge(:prefix => object_name, :field_name => fragment_name(fragment), :default => value, :include_blank => include_blank?)
        #   template.send(:"text_field_#{fragment}", value, opts, input_html_options.merge(:id => fragment_id(fragment), :class => klass))
        # end


        # ORIGINAL FORMTASTIC
     
        # def to_html
        #   input_wrapping do
        #     fragments_wrapping do
        #       hidden_fragments <<
        #       fragments_label <<
        #       template.content_tag(:ol,
        #         fragments.map do |fragment|
        #           fragment_wrapping do
        #             fragment_label_html(fragment) <<
        #             fragment_input_html(fragment)
        #           end
        #         end.join.html_safe, # TODO is this safe?
        #         { :class => 'fragments-group' } # TODO refactor to fragments_group_wrapping
        #       )
        #     end
        #   end
        # end
        # 
        # def fragments
        #   date_fragments + time_fragments
        # end
        # 
        # def time_fragments
        #   options[:include_seconds] ? [:hour, :minute, :second] : [:hour, :minute]
        # end
        # 
        # def date_fragments
        #   options[:order] || i18n_date_fragments || default_date_fragments
        # end
        # 
        # def default_date_fragments
        #   [:year, :month, :day]
        # end
        # 
        # def fragment_wrapping(&block)
        #   template.content_tag(:li, template.capture(&block), fragment_wrapping_html_options)
        # end
        # 
        # def fragment_wrapping_html_options
        #   { :class => 'fragment' }
        # end
        # 
        # def fragment_label(fragment)
        #   labels_from_options = options[:labels] || {}
        #   if labels_from_options.key?(fragment)
        #     labels_from_options[fragment]
        #   else
        #     ::I18n.t(fragment.to_s, :default => fragment.to_s.humanize, :scope => [:datetime, :prompts])
        #   end
        # end
        # 
        # def fragment_id(fragment)
        #   "#{input_html_options[:id]}_#{position(fragment)}i"
        # end
        # 
        # def fragment_name(fragment)
        #   "#{method}(#{position(fragment)}i)"
        # end
        # 
        # def fragment_label_html(fragment)
        #   text = fragment_label(fragment)
        #   text.blank? ? "".html_safe : template.content_tag(:label, text, :for => fragment_id(fragment))
        # end
        # 
        # def value
        #   object.send(method) if object && object.respond_to?(method)
        # end
        # 
        # def fragment_input_html(fragment)
        #   opts = input_options.merge(:prefix => fragment_prefix, :field_name => fragment_name(fragment), :default => value, :include_blank => include_blank?)
        #   template.send(:"select_#{fragment}", value, opts, input_html_options.merge(:id => fragment_id(fragment)))
        # end
        # 
        # def fragment_prefix
        #   if builder.options.key?(:index)
        #     object_name + "[#{builder.options[:index]}]"
        #   else
        #     object_name
        #   end
        # end
        # 
        # # TODO extract to BlankOptions or similar -- Select uses similar code
        # def include_blank?
        #   options.key?(:include_blank) ? options[:include_blank] : builder.include_blank_for_select_by_default
        # end
        # 
        # def positions
        #   { :year => 1, :month => 2, :day => 3, :hour => 4, :minute => 5, :second => 6 }
        # end
        # 
        # def position(fragment)
        #   positions[fragment]
        # end
        # 
        # def i18n_date_fragments
        #   order = ::I18n.t(:order, :scope => [:date])
        #   order = nil unless order.is_a?(Array)
        #   order
        # end
        # 
        # def fragments_wrapping(&block)
        #   template.content_tag(:fieldset,
        #     template.capture(&block).html_safe, 
        #     fragments_wrapping_html_options
        #   )
        # end
        # 
        # def fragments_wrapping_html_options
        #   { :class => "fragments" }
        # end
        # 
        # def fragments_label
        #   if render_label?
        #     template.content_tag(:legend, 
        #       builder.label(method, label_text, :for => fragment_id(fragments.first)), 
        #       :class => "label"
        #     )
        #   else
        #     "".html_safe
        #   end
        # end
        # 
        # def fragments_inner_wrapping(&block)
        #   template.content_tag(:ol,
        #     template.capture(&block)
        #   )
        # end
        # 
        # def hidden_fragments
        #   "".html_safe
        # end
        # 
        # def hidden_field_name(fragment)
        #   if builder.options.key?(:index)
        #     "#{object_name}[#{builder.options[:index]}][#{fragment_name(fragment)}]"
        #   else
        #     "#{object_name}[#{fragment_name(fragment)}]"
        #   end
        # end

      end
    end
  end
end
module FormtasticBootstrap
  
  class FormBuilder < Formtastic::FormBuilder

    configure :default_hint_class, 'help-block'

    def text_area(method, input_html_options)
      template.content_tag(:div, :class => "input") do 
        super(method, input_html_options)
      end
    end

    def text_field(method, input_html_options)
      template.content_tag(:div, :class => "input") do 
        super(method, input_html_options)
      end
    end

    include FormtasticBootstrap::Helpers::InputHelper
    include FormtasticBootstrap::Helpers::InputsHelper
    include FormtasticBootstrap::Helpers::ButtonsHelper

  end

end
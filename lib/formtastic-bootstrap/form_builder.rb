module FormtasticBootstrap
  
  class FormBuilder < Formtastic::FormBuilder

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

    def password_field(method, input_html_options)
      template.content_tag(:div, :class => "input") do 
        super(method, input_html_options)
      end
    end

    def email_field(method, input_html_options)
      template.content_tag(:div, :class => "input") do 
        super(method, input_html_options)
      end
    end

    def hidden_field(method, input_html_options)
      template.content_tag(:div, :class => "input") do 
        super(method, input_html_options)
      end
    end

    def phone_field(method, input_html_options)
      template.content_tag(:div, :class => "input") do 
        super(method, input_html_options)
      end
    end

    include FormtasticBootstrap::Helpers::InputHelper
    include FormtasticBootstrap::Helpers::InputsHelper
    include FormtasticBootstrap::Helpers::ButtonsHelper

  end

end
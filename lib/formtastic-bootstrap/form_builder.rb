module FormtasticBootstrap
  
  class FormBuilder < Formtastic::FormBuilder

    def bootstrap_input_wrapper
      template.content_tag(:div, :class => "input") do 
        yield
      end
    end
    private :bootstrap_input_wrapper

    def email_field(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    def hidden_field(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    def password_field(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    def phone_field(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    def search_field(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    def text_area(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    def text_field(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    def url_field(method, input_html_options)
      bootstrap_input_wrapper do
        super(method, input_html_options)
      end
    end

    include FormtasticBootstrap::Helpers::InputHelper
    include FormtasticBootstrap::Helpers::InputsHelper
    include FormtasticBootstrap::Helpers::ButtonsHelper

  end

end
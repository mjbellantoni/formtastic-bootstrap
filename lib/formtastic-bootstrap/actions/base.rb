module FormtasticBootstrap
	module Actions
		module Base

			def wrapper(&block)
				template.capture(&block)
			end

			def button_html
				new_class = [super[:class], wrapper_html_options[:class], "btn"]
				new_class << "btn-primary" if method == :submit
				new_class = new_class.compact.join(" ")
				wrapper_html_options.merge(super).merge(:class => new_class)
			end

		end
	end
end

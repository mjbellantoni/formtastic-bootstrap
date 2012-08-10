# Alas, I need to duplicate code from Formtastic::Inputs::Base::Numeric because
# there's no way to re-import that module.
module FormtasticBootstrap
	module Inputs
		module Base
			module Numeric

				include Formtastic::Inputs::Base::Numeric

				def wrapper_html_options
					new_class = [super[:class], "numeric", "stringish"].compact.join(" ")
					super.merge(:class => new_class)
				end

			end
		end
	end
end

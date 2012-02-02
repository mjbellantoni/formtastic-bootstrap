module FormtasticBootstrap
	module Helpers
		module ActionHelper
			include Formtastic::Helpers::ActionHelper

			def standard_action_class_name(as)
			  "FormtasticBootstrap::Actions::#{as.to_s.camelize}Action"
			end

		end
	end
end

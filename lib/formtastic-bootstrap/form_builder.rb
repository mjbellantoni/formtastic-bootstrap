module FormtasticBootstrap
  
  class FormBuilder < Formtastic::FormBuilder

    configure :default_inline_error_class, 'help-inline'
    configure :default_block_error_class,  'help-block'

    include FormtasticBootstrap::Helpers::InputHelper
    include FormtasticBootstrap::Helpers::InputsHelper
    include FormtasticBootstrap::Helpers::ButtonsHelper

  end

end
module FormtasticBootstrap
  
  class FormBuilder < Formtastic::FormBuilder

    configure :default_inline_error_class, 'help-inline'
    configure :default_block_error_class,  'help-block'
    configure :default_inline_hint_class,  'help-inline'
    configure :default_block_hint_class,   'help-block'

    def self.default_error_class
      # self.default_inline_error_class
      raise
    end
    
    def self.default_error_class=(error_class)
      # self.default_inline_error_class = error_class
      # self.default_block_error_class = error_class
      raise
    end
    
    def self.default_hint_class
      # self.default_inline_hint_class
      raise
    end
    
    def self.default_hint_class=(hint_class)
      # self.default_inline_hint_class = hint_class
      # self.default_block_hint_class = hint_class
      raise
    end

    include FormtasticBootstrap::Helpers::InputHelper
    include FormtasticBootstrap::Helpers::InputsHelper
    include FormtasticBootstrap::Helpers::ButtonsHelper

  end

end
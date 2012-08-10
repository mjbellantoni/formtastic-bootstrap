module Formtastic
  module LocalizedString

    def model_name
      @object.present? ? @object.class.name : @object_name.to_s.classify
    end

    protected

    def localized_string(key, value, type, options = {}) #:nodoc:
      current_builder = respond_to?(:builder) ? builder : self    
      localizer = Formtastic::FormBuilder.i18n_localizer.new(current_builder)
      localizer.localize(key, value, type, options)
    end

  end
end


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
    include FormtasticBootstrap::Helpers::ActionHelper
    include FormtasticBootstrap::Helpers::ActionsHelper

  end

end

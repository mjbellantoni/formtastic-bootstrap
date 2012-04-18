module FormtasticBootstrap
  module Actions
    extend ActiveSupport::Autoload

    autoload :Base,         'formtastic-bootstrap/actions/base'
    autoload :InputAction,  'formtastic-bootstrap/actions/input_action'
    autoload :LinkAction,   'formtastic-bootstrap/actions/link_action'
    autoload :ButtonAction, 'formtastic-bootstrap/actions/button_action'
  end
end

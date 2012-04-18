module FormtasticBootstrap
  module Actions
    extend ActiveSupport::Autoload

    autoload :Base,         'formtastic-bootstrap/actions/base'
    # autoload :Buttonish,
    # autoload :InputAction
    # autoload :LinkAction
    autoload :ButtonAction, 'formtastic-bootstrap/actions/button_action'
  end
end

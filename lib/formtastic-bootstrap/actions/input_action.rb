# <form...>
#   <fieldset class="form-actions">
#     <input class="btn" type="reset" value="Reset">
#     <input class="btn" type="submit" value="Create Post">
#   </fieldset>
# </form>
module FormtasticBootstrap
  module Actions
    class InputAction < Formtastic::Actions::InputAction
      include Base
    end
  end
end
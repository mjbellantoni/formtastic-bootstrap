# <form...>
#   <fieldset class="form-actions">
#     <button class="btn" type="reset" value="Reset">
#     <button class="btn" type="submit" value="Create Post">
#   </fieldset>
# </form>
module FormtasticBootstrap
  module Actions
    class ButtonAction < Formtastic::Actions::ButtonAction
      include Base
    end
  end
end
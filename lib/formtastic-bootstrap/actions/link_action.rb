# <form...>
#   <fieldset class="form-actions">
#     <a class="btn" href="">Link</a>
#   </fieldset>
# </form>
module FormtasticBootstrap
  module Actions
    class LinkAction < Formtastic::Actions::LinkAction
      include Base
    end
  end
end
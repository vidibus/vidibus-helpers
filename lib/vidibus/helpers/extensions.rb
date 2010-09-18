require "helpers/extensions/controller"
require "helpers/extensions/view"

ActiveSupport.on_load(:action_controller) do
  include Vidibus::Helpers::Extensions::Controller
end

ActiveSupport.on_load(:action_view) do
  include Vidibus::Helpers::Extensions::View
end

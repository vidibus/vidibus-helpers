module Vidibus
  module Helpers
    module Extensions
      module Controller
        extend ActiveSupport::Concern

        included do
          helper_method :current_host
        end

        # Returns current hostname with protocol.
        def current_host
          @current_host ||= "#{request.protocol}#{request.host_with_port}"
        end
      end
    end
  end
end

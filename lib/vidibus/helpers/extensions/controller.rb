module Vidibus
  module Helpers
    module Extensions
      module Controller
        extend ActiveSupport::Concern

        included do
          helper_method :current_host, :current_url
        end

        # Returns current hostname with protocol.
        def current_host
          @current_host ||= "#{request.protocol}#{request.host_with_port}"
        end

        # Returns the current url.
        # Provide :params => true to include request params.
        def current_url(options = {})
          path = (options[:params] == true) ? request.fullpath : request.path
          "#{current_host}#{path}"
        end
      end
    end
  end
end

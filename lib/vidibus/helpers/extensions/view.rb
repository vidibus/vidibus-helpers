module Vidibus
  module Helpers
    module Extensions
      module View

        # Renders flash message.
        # TODO: Make it more flexible!
        def render_flash
          return unless flash.any?
          level = flash.keys.last
          %(<div id="flash" class="#{level}"><div>#{flash[level]}</div></div>).html_safe
        end

        # Returns next number for tab order.
        def autotab
          @autotab ||= 0
          @autotab += 1
        end
      end
    end
  end
end

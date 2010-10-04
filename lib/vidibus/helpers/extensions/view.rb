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

        # Formats a number or float as human duration.
        #
        # Examples:
        #
        #   number_to_duration(24.5)                  # => "00:25"
        #   number_to_duration(24.5, :hours => true)  # => "00:00:25"
        #   number_to_duration(3654)                  # => "01:00:54"
        #   number_to_duration(3654, :hours => false) # => "60:54"
        #
        def number_to_duration(seconds, options = {})
          hours = options[:hours]
          seconds = seconds.to_f.round
          hour = (seconds / 3600).floor unless hours == false
          min  = (seconds / 60).floor
          sec  = (seconds % 60).round
          if hours != false and (hours == true or hour > 0)
            min -= hour * 60
            output = "%02d:" % hour
          else
            output = ''
          end
          output + "%02d:%02d" % [ min, sec ]
        end
      end
    end
  end
end

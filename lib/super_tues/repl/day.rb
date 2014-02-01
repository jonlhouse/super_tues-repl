require 'super_tues/repl/console_helpers'

module SuperTues
  module Repl
    class Day
      include ConsoleHelpers
      def initialize(game)
        @game = game
      end

      def print
        say HR
        say @game.today.to_s
        say HR
        say "\n"
        say "Today's Events:"
        @game.today.events.each do |event|
          say "  * #{event}"
        end
        say HR
        say "\n\n"
      end

      def events
        @game.today.events.each do |event|
          handle_event(event)
        end
      end      

      def handle_event(event)
        event.notify(@game.players) do |player, notice|
          color "#{player}: ", player.color
          say "#{notice}"
        end
        ask "\n\nAny key to continue."

        event.interact(@game.players) do |player, interaction|
          lookup = {
            business: BusinessAction        
          }
          result = lookup[event.type].new.pick(player)
        end
      end

    end
  end
end
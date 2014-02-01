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

      end

      def take_turns
      end
    end
  end
end
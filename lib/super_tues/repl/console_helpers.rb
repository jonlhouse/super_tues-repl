module SuperTues
  module Repl
    module ConsoleHelpers
      HR = "-" * 60

      def clear
        puts "\e[H\e[2J"
      end
      
      def color(str, sym)
        say "<%= color '#{str}', :#{sym} %>"
      end

      def player_color(player)
        player.color
      end
    end
  end
end

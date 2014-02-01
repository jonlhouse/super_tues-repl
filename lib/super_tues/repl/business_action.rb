module SuperTues
  module Repl

    class BusinessAction
      include ConsoleHelpers

      def pick(player)
        loop do
          clear
          color HR, player.color
          print_funds(player)
          say "\n"
          color HR, player.color
          say "\n\nPick an Action:"
          choose do |menu|
            menu.choice "Radio Spot"
            menu.choice "Political Favor"
            menu.choice "Play Card"
            menu.choice "Focus on the Issues"
            menu.choice "Poll a State"
            menu.choice "Discard"
            menu.choice "Pass"
          end
        end 
      end

      def print_funds(player)
        color "#{player.name}", player.color
        say "  Funds:"
        say "  * #{player.cash}"
        say "  * #{player.clout}"
        say "  * #{player.cards.length} Cards:"
        list_cards(player.cards, indent: 4)
      end

      def list_cards(cards, indent: 0)
        cards.each_with_index do |card, index|
          indentation = " " * indent
          say "#{indentation}#{index+1}) "
          color "#{card.title}: ", :bold
          say "#{card.description}"
        end
      end

    end

  end
end
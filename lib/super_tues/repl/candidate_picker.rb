require 'super_tues/repl/console_helpers'

module SuperTues
  module Repl
    class CandidatePicker
      include ConsoleHelpers

      def initialize(player)
        @player = player
      end

      def pick
        color "#{@player} Please Pick Candidate", :headline
        say "\n"
        choose do |menu|
          @player.candidates_dealt.each do |candidate|
            menu.choice(pp candidate) { candidate }
          end
        end
      end

      def pp(candidate)
        str = ""
        str += candidate.name + "\n"
        str += "   Payday: #{candidate.cash}, #{candidate.clout}, #{candidate.cards} Cards" + "\n"
        str += "   Home State: #{candidate.state}" + "\n"
        str += "   #{candidate.special}" + "\n" if candidate.has_special?
        str += "   #{candidate.description}" + "\n"
        str
      end

    end
  end
end
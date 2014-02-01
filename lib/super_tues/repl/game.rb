require 'super_tues/repl/console_helpers'

module SuperTues
  module Repl

    class Game
      include ConsoleHelpers

      def initialize
        @scheme = HighLine::ColorScheme.new do |cs|
          cs[:headline] = [:bold, :yellow]
          cs[:red] = [:red]
          cs[:blue] = [:blue]
          cs[:yellow] = [:yellow]
          cs[:green] = [:green]
        end
        HighLine.color_scheme = @scheme
      end

      # Main entry point for the SuperTues command line REPL.
      # 
      def play
        welcome
        case new_or_continue
        when :new
          @game = SuperTues::Board::Game.new
          @game.add_players *get_players
          pick_candidates
          init_game
        when :continue
          # @game = Game.load ........
          # load_game
        end
        
        game_loop
        
      end

      def welcome
        clear
        say "Welcome to <%= color 'SuperTuesday', :headline %>!!"
        say "\n"
        say "The game where keeping dirty little secrets is sometimes the best move."
        say "SuperTueday (c) Peder Lindber, Game Engine (c) John House"
        say "\n"
        say HR
      end

      def new_or_continue
        choose do |menu|
          menu.prompt = "New Game or Continue?"
          menu.index = :none      # first letter
          menu.layout = :one_line
          menu.choice(:new)
          menu.choice(:continue)
        end
      end

      def get_players
        clear
        players = []
        ask "How many players?", Integer do |q|
          q.in = 3..6
        end.times do |n|
          name = ask "Player #{n} name?" do |q|
            q.default = "Player-#{n}"
          end
          players << SuperTues::Board::Player.new(name: name)
        end
        players
      end

      def pick_candidates
        clear
        @game.deal_candidates
        @game.players.each do |player|
          say HR
          player.candidate = CandidatePicker.new(player).pick
        end
      end

      def init_game
        clear
        @game.start_game
      end

      def game_loop
        loop do
          clear
          today = Day.new(@game)
          today.print
          today.events
          ask "Press any key for tomorrow."
          @game.tomorrow!
        end
      end
    end    
  end
end

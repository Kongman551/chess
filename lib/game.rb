# frozen_string_literal: true

require_relative 'display'
require_relative 'board'

class Game
    include Display

    attr_accessor :board

    def initialize
        @board = Board.new
    end

    def play_game
        intro
        rules
        board.start_board
        display_board(board)
        select_piece
    end

    def select_piece
        loop do
            ask_player_coor
            input = get_input_coor
            break if verify_input(input)

            puts "Invalid Input"
        end
    end

    def get_input_coor
        input = gets.chomp
    end

    def verify_input(input)
        # input can only be a1-h8
        input.length == 2 && input[0] =~ /[a-h]/ && input[1] =~ /[1-8]/
    end
end
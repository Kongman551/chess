# frozen_string_literal: true

require_relative 'display'
require_relative 'board'

class Game
    include Display

    attr_accessor :board

    def initialize
        @board = Board.new
        @player = 1
    end

    def play_game
        intro
        rules
        board.start_board
        display_board(board)
        player_turn
    end
    
    def player_turn
        display_player(@player)
        @current_selection = get_coor
    end

    def get_coor
        input_coor = get_player_input
        until verify_input(input_coor)
            invalid_input
            input_coor = get_player_input
        end
        input_coor
    end

    def get_player_input
        ask_player_coor
        gets.chomp
    end

    def verify_input(input)
        # input can only be a1-h8
        input.length == 2 && input[0] =~ /[a-h]/ && input[1] =~ /[1-8]/
    end

    def switch_player
        @player == 1 ? @player = 2 : @player = 1
    end

    def highlight_piece(piece)

    end
end
# frozen_string_literal: true

require_relative 'display'
require_relative 'board'
require_relative 'translator'

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
        6.times do
            player_turn
            board.to_s
        end
    end
    
    def player_turn
        display_player(@player)
        current_selection = translate_input(get_coor)
        until @board.select_space(current_selection[0], current_selection[1])
            invalid_input
            current_selection = translate_input(get_coor)
        end
        @board.show_avail_moves
        switch_player
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

    def game_over?
        false
    end

    def translate_input(input)
        translator ||= Translator.new
        translator.translate(input)
    end
end
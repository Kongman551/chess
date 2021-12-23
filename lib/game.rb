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
        system 'clear'
        board.start_board
        display_board(board)
        board.test
    end
end
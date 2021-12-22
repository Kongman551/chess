# frozen_string_literal: true

require_relative 'display'
require_relative 'board'

class Game
    include Display

    attr_accessor :board

    def initialize
        @board = Board.new
    end

    def test
        @board.start_board
        display_board
    end
end
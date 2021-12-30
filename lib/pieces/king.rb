# frozen_string_literal: true

require_relative 'piece'

class King < Piece
    def initialize(symbol, color, location)
        super(symbol, color, location)
        @moves = [[-1, 0], [1, 0], [0, 1], [0, -1], [-1, -1], [1, 1], [-1, 1], [1, -1]]
    end
end
# frozen_string_literal: true

require_relative 'piece'

class Pawn < Piece
    def initialize(symbol, color, location)
        super(symbol, color, location)
        @moved = false
        create_moves
    end

    def create_moves
        if @moved == false 
            @moves = [[-1, 0], [1, 0], [2, 0], [-2, 0], [-1, -1], [1, 1], [-1, 1], [1, -1]]
        else
            
    end
end
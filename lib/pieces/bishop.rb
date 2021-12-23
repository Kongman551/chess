# frozen_string_literal: true

require_relative 'piece'

class Bishop < Piece
    def initialize(symbol, color, location)
        super(symbol, color, location)
    end
end
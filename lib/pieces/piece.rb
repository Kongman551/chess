# frozen_string_literal: true

# superclass for piece types
class Piece
    attr_accessor :symbol, :color, :location

    def initialize(symbol, color, location)
        @symbol = symbol
        @color = color
        @location = location
    end
end
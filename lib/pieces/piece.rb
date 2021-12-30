# frozen_string_literal: true

# superclass for piece types
class Piece
    attr_accessor :symbol, :color, :location

    def initialize(symbol, color, location)
        @symbol = symbol
        @color = color
        @location = location
    end

    def children
        @moves.map{ |m| [@location[0] + m[0], @location[1] + m[1]] }
              .keep_if { |x| Piece.valid_space?(x) }
    end

    def self.valid_space?(position)
        position[0].between?(0, 7) && position[1].between?(0, 7)
    end
end
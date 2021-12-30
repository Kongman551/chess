# frozen_string_literal: true

require_relative 'piece'

class Knight < Piece
    attr_accessor :moves

    def initialize(symbol, color, location)
        super(symbol, color, location)
        @moves = [[1,2],[-2,-1],[-1,2],[2,-1],[1,-2],[-2,1],[-1,-2],[2,1]].freeze
    end
end
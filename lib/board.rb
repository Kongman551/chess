# frozen_string_literal: true

require_relative 'display'
require_relative './pieces/king'

class Board
    include Display

    attr_accessor :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
    end

    def start_board
        (0..7).each do |row|
            (0..7).each do |space|
                row.even? && space.even? || row.odd? && space.odd? ? @grid[row][space] = grey_space : @grid[row][space] = red_space
            end
        end
        create_pieces
        insert_pieces
    end

    def create_pieces
        @bking = King.new(black_king) 
        @wking = King.new(white_king)
    end

    def insert_pieces
        @grid[0][3] = red_space(@bking.symbol)
        @grid[7][3] = grey_space(@wking.symbol)
    end
end
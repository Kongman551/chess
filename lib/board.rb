# frozen_string_literal: true

require_relative 'display'
require_relative './pieces/king'
require_relative './pieces/queen'
require_relative './pieces/knight'
require_relative './pieces/rook'
require_relative './pieces/bishop'
require_relative './pieces/pawn'

class Board
    include Display

    attr_accessor :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) { empty_space } }
    end

    def start_board
        insert_pieces
        show_pieces
    end

    def insert_pieces
        insert_black
        insert_red
    end

    # black is default color
    # all pieces except pawn start on row 0
    def insert_black(color = :black, coor = 0)
        insert_king(black_king, color, coor)
        insert_queen(black_queen, color, coor)
        insert_knights(black_knight, color, coor)
        insert_rooks(black_rook, color, coor)
        insert_bishops(black_bishop, color, coor)
        insert_pawns(black_pawn, color, 1)
    end

    # red is default color
    # all pieces except pawn start on row 7
    def insert_red(color = :red, coor = 7)
        insert_king(red_king, color, coor)
        insert_queen(red_queen, color, coor)
        insert_knights(red_knight, color, coor)
        insert_rooks(red_rook, color, coor)
        insert_bishops(red_bishop, color, coor)
        insert_pawns(red_pawn, color, 6)
    end

    def insert_king(symbol, color, coor)
        @grid[coor][3] = King.new(symbol, color, [coor, 3])
    end

    def insert_queen(symbol, color, coor)
        @grid[coor][4] = Queen.new(symbol, color, [coor, 4])
    end

    def insert_knights(symbol, color, coor)
        @grid[coor][1] = Knight.new(symbol, color, [coor, 1])
        @grid[coor][6] = Knight.new(symbol, color, [coor, 6])
    end

    def insert_rooks(symbol, color, coor)
        @grid[coor][0] = Rook.new(symbol, color, [coor, 0])
        @grid[coor][7] = Rook.new(symbol, color, [coor, 7])
    end

    def insert_bishops(symbol, color, coor)
        @grid[coor][2] = Bishop.new(symbol, color, [coor, 2])
        @grid[coor][5] = Bishop.new(symbol, color, [coor, 5])
    end

    def insert_pawns(symbol, color, coor)
        (0..7).each do |x|
            @grid[coor][x] = Pawn.new(symbol, color, [coor, x])
        end
    end

    def select_space

    end

    # uses print_help to print empty space or piece
    def show_pieces
        @grid.each do |row|
            row.map! do |space|
                print_help(space)
            end
        end
    end
end
# frozen_string_literal: true

require_relative 'display'
require_relative './pieces/king'
require_relative './pieces/queen'
require_relative './pieces/knight'
require_relative './pieces/rook'
require_relative './pieces/bishop'
require_relative './pieces/pawn'
require_relative './pieces/piece'
require_relative 'game'

class Board
    include Display

    attr_accessor :grid, :current_piece

    def initialize
        @grid = Array.new(8) { Array.new(8) { empty_space } }
        @current_piece = nil
    end

    def start_board
        insert_pieces
        to_s
    end

    def insert_pieces
        insert_black
        insert_red
    end

    def to_s
        display_board
    end

    # black is default color
    # all pieces except pawn start on row 0
    def insert_black(color = :black, coor = 0)
        insert_king(king, color, coor)
        insert_queen(queen, color, coor)
        insert_knights(knight, color, coor)
        insert_rooks(rook, color, coor)
        insert_bishops(bishop, color, coor)
        insert_pawns(pawn, color, 1)
    end

    # red is default color
    # all pieces except pawn start on row 7
    def insert_red(color = :red, coor = 7)
        insert_king(king, color, coor)
        insert_queen(queen, color, coor)
        insert_knights(knight, color, coor)
        insert_rooks(rook, color, coor)
        insert_bishops(bishop, color, coor)
        insert_pawns(pawn, color, 6)
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
    
    def show_avail_moves(piece)

    end

    def select_space(row, col)
        sel = @grid[row][col]
        is_piece?(sel) ? @current_piece = sel : false        
    end
 
    def is_piece?(space)
        space != " "
    end
end

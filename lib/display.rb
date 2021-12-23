require 'colorize'
require_relative './pieces/piece'
#require_relative 'game'

module Display
    def empty_space; "[ ]" end

    def black_king; "\u265a".black end

    def red_king; "\u265a".red end

    def black_queen; "\u265b".black end

    def red_queen; "\u265b".red end
    
    def black_knight; "\u265e".black end

    def red_knight; "\u265e".red end

    def black_rook; "\u265c".black end

    def red_rook; "\u265c".red end

    def black_bishop; "\u265d".black end

    def red_bishop; "\u265d".red end

    def black_pawn; "\u265f".black end

    def red_pawn; "\u265f".red end

    def display_board(board)
        num = 8
        board.grid.map do |row|
            print "#{num} "
            puts row.join("")
            puts "  ------------------------"
            num -= 1
        end
        print "   "
        puts (1..8).to_a.join("  ")
    end

    def print_help(grid_item)
        grid_item == "[ ]" ? "[ ]" : "[#{grid_item.symbol}]"
    end
end
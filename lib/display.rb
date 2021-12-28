# frozen_string_literal: true

require 'colorize'
require_relative './pieces/piece'

module Display
    def intro
        system 'clear'
        puts "Welcome to Chess!\n\n".white.on_light_black
    end

    def rules
        puts "The rules can be found at the link below:\n"
        puts "https://www.chessvariants.org/d.chess/chess.html\n\n"
        puts "Press any key to continue..."
        gets.chomp
        system 'clear'
    end

    def display_player(player)
        puts "Player #{player}, it's your turn"
    end

    def ask_player_coor
        puts "Select a piece using algebraic notation"
    end
    
    def invalid_input
        puts "Invalid input, select again"
    end

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
        puts (:A..:H).to_a.join("  ")
    end

    # checks space for empty else prints piece symbol
    def print_help(grid_item)
        grid_item == "[ ]" ? "[ ]" : "[#{grid_item.symbol}]"
    end
end
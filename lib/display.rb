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

    def empty_space; " " end

    def king; "\u265a" end

    def queen; "\u265b" end
    
    def knight; "\u265e" end

    def rook; "\u265c" end

    def bishop; "\u265d" end

    def pawn; "\u265f" end

    def display_board(board)
        system 'clear'
        num = 8
        board.grid.map do |row|
            print "#{num} "
            puts row.join("")
            num -= 1
        end
        print "   "
        puts (:A..:H).to_a.join("  ")
    end

    # uses print_help to print empty space or piece
    # 100 = Grey background
    # 101 = light_red background
    def show_pieces(grid)
        grid.each_with_index do |row, index|
            show_row(row, index)
        end
    end

    def show_row(row, index)
        row.map!.with_index do |space, col|
            if index.even? && col.even? || index.odd? && col.odd?
                print_help(space, 100)
            else
                print_help(space, 101)
            end
        end
    end

    # checks space for empty else prints piece symbol and sets color
    # 30 = Black font
    # 31 = Red font
    def print_help(grid_item, bg_color)
        if grid_item == empty_space
            set_color(30, bg_color, empty_space)
        else
            if grid_item.color == :black
                set_color(30, bg_color, grid_item.symbol)
            elsif grid_item.color == :red
                set_color(31, bg_color, grid_item.symbol)
            end
        end
    end

    def set_color(font_color, bg_color, str)
        "\e[#{font_color};#{bg_color}m #{str} \e[0m"
    end
end
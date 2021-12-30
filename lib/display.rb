# frozen_string_literal: true

#require_relative './pieces/piece'

module Display

    def intro
        system 'clear'
        puts "Welcome to Chess!\n\n"
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

    def display_board
        system 'clear'
        print_grid 
    end

    def print_grid
        num = 8
        print "   #{(:A..:H).to_a.join("  ")}"
        @grid.each_with_index do |row, index|
            puts
            print "#{num} "
            show_row(row, index)
            print " #{num}"
            row.join("")
            num -= 1
        end
        puts "\n   #{(:A..:H).to_a.join("  ")}\n"
    end

    # uses print_help to print empty space or piece
    # 100 = Grey background
    # 101 = light_red background

    def show_row(row, row_idx)
        row.each_with_index do |space, col_idx|
            bg_color = set_bg_color(row_idx, col_idx)
            print_help(row_idx, col_idx, space, bg_color)
        end
    end

    def set_bg_color(row_idx, col_idx)
        if @current_piece&.location == [row_idx, col_idx]
            103
        elsif (row_idx + col_idx).even?
            101
        else
            100
        end 
    end 

    # checks space for empty else prints piece symbol and sets color
    # 30 = Black font
    # 31 = Red font
    def print_help(row_idx, col_idx, grid_item, bg_color)
        if grid_item != empty_space
            font_color = grid_item.color == :black ? 30 : 31
            set_color(font_color, bg_color, grid_item.symbol)
        else
            set_color(30, bg_color, empty_space)
        end
    end

    def set_color(font_color, bg_color, str)
        print "\e[#{font_color};#{bg_color}m #{str} \e[0m"
    end
end
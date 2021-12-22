require 'colorize'
#require_relative 'board'
#require_relative 'game'

module Display
    def grey_space(sym = " ")
        " #{sym} ".colorize(:background => :light_black)
    end

    def red_space(sym = " ")
        " #{sym} ".colorize(:background => :light_red)
    end

    def black_king
        "\u265a"
    end

    def white_king
        "\u2654"
    end

    def display_board
        num = 8
        @board.grid.each do |row|
            print "#{num} "
            puts row.join("")
            num -= 1
        end
        print "   "
        puts (1..8).to_a.join("  ")
    end
end
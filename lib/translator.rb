# frozen_string_literal: true

class Translator
    def initialize
        @row = nil
        @column = nil
    end

    def translate(notation)
        coor = notation.split('')
        [@row = translate_row(coor[1]), @column = translate_col(coor[0])]
    end

    def translate_row(number)
        8 - number.to_i
    end

    def translate_col(letter)
        letter.ord - 97
    end
end
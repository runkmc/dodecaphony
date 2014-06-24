require_relative 'row'

module Dodecaphony
  class Calculator

    def initialize row
      self.row = row
    end

    def p0
      row
    end

    (0..11).each do |i|
      define_method "p#{i}".to_sym do
        transposed_row = row.pitches.each_with_object([]) { |pitch, new_row|
          new_row << row.intervals[(transpose i, pitch)].name
        }.to_a 
        Dodecaphony::Row.new transposed_row
      end
    end

    private

    attr_accessor :row

    def transpose interval, pitch
      (starting_pitch.distance_from(pitch) + interval) % 12
    end

    def starting_pitch
      row.pitches[0]
    end

  end
end

require_relative 'row'

module Dodecaphony
  class Calculator

    def initialize row
      self.row = row
    end

    def i0
      row.each_with_object([]) { |pitch, new_row|
        new_row << row.intervals[((row.intervals.key(pitch) - 12).abs)].name
      }
    end

    (1..11).each do |i|
      define_method "i#{i}".to_sym do
        corresponding_p = self.send("p#{i}").to_a
        new_row = Dodecaphony::Row.new corresponding_p
        (self.class.new new_row).i0
      end
    end

    (0..11).each do |i|
      define_method "p#{i}".to_sym do
        row.pitches.each_with_object([]) { |pitch, new_row|
          new_row << row.intervals[(transpose i, pitch)].name
        }
      end

      define_method "r#{i}".to_sym do
        self.send("p#{i}").reverse
      end

      define_method "ri#{i}".to_sym do
        self.send("i#{i}").reverse
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

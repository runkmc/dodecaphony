require_relative 'row'

module Dodecaphony
  class Calculator

    def initialize row
      self.row = row
    end

    def i0
      Dodecaphony::Row.new row.each_with_object([]) { |pitch, new_row|
        new_row << row.intervals[((row.intervals.key(pitch) - 12).abs)].name
      }.to_a 
    end

    (0..11).each do |i|
      define_method "p#{i}".to_sym do
        transposed_row = row.pitches.each_with_object([]) { |pitch, new_row|
          new_row << row.intervals[(transpose i, pitch)].name
        }.to_a 
        Dodecaphony::Row.new transposed_row
      end
    end

    (1..11).each do |i|
      define_method "i#{i}".to_sym do
        corresponding_p = self.send("p#{i}").to_a
        new_row = Dodecaphony::Row.new corresponding_p
        (self.class.new new_row).i0
      end
    end

    (0..11).each do |i|
      define_method "r#{i}".to_sym do
        new_row = self.send("p#{i}".to_sym).
          to_a.reverse.each_with_object([]) do |pitch, row|
          row << pitch
        end
        Dodecaphony::Row.new new_row
      end
    end

    (0..11).each do |i|
      define_method "ri#{i}".to_sym do
        new_row = self.send("i#{i}").
          to_a.reverse.each_with_object([]) do |pitch, row|
          row << pitch
        end
        Dodecaphony::Row.new new_row
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

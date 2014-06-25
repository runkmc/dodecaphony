require_relative 'row'

module Dodecaphony
  class Calculator

    def initialize row
      self.row = row
    end

    (0..11).each do |i|
      define_method "p#{i}".to_sym do
        transposed_row = row.pitches.each_with_object([]) { |pitch, new_row|
          new_row << row.intervals[(transpose i, pitch)].name
        }.to_a 
        Dodecaphony::Row.new transposed_row
      end
    end

    # def i0
    #   original_row.each_with_object([]) do |pitch, row|
    #     row << intervals[((row_with_intervals.key(pitch) - 12).abs)].name
    #   end
    # end
    #
    # (0..11).each do |i|
    #   define_method "p#{i}".to_sym do
    #     original_row.each_with_object([]) do |pitch, row|
    #       row << intervals[(transpose i, pitch)].name
    #     end
    #   end
    # end
    #
    # (1..11).each do |i|
    #   define_method "i#{i}".to_sym do
    #     corresponding_p = self.send("p#{i}")
    #     new_row = self.class.new corresponding_p
    #     new_row.i0
    #   end
    # end
    #
    # (0..11).each do |i|
    #   define_method "r#{i}".to_sym do
    #     self.send("p#{i}".to_sym).reverse.each_with_object([]) do |pitch, row|
    #       row << pitch
    #     end
    #   end
    # end
    #
    # (0..11).each do |i|
    #   define_method "ri#{i}".to_sym do
    #     self.send("i#{i}").reverse.each_with_object([]) do |pitch, row|
    #       row << pitch
    #     end
    #   end
    # end
    
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

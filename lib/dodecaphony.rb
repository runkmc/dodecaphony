require_relative 'pitch'
require 'set'

class Dodecaphony

  attr_reader :original_row

  def initialize tone_row
    self.original_row = create_row_with_pitches(tone_row)
    validate_size_of original_row
    self.row_with_intervals = create_list_with_intervals(original_row,
                                                         starting_pitch)
  end

  def spell_with_sharps
    normalize_row(:spell_as_sharp)
  end

  def spell_with_flats
    normalize_row(:spell_as_flat)
  end

  def i0
    original_row.each_with_object([]) do |pitch, row|
      row << row_with_intervals[((row_with_intervals.key(pitch) - 12).abs)].name
    end
  end

  (0..11).each do |i|
    define_method "p#{i}".to_sym do
      original_row.each_with_object([]) do |pitch, row|
        row << row_with_intervals[(transpose i, pitch)].name
      end
    end
  end

  (1..11).each do |i|
    define_method "i#{i}".to_sym do
      corresponding_p = self.send("p#{i}")
      new_row = Dodecaphony.new corresponding_p
      new_row.i0
    end
  end

  (0..11).each do |i|
    define_method "r#{i}".to_sym do
      self.send("p#{i}".to_sym).reverse.each_with_object([]) do |pitch, row|
        row << pitch
      end
    end
  end

  (0..11).each do |i|
    define_method "ri#{i}".to_sym do
      self.send("i#{i}").reverse.each_with_object([]) do |pitch, row|
        row << pitch
      end
    end
  end

  private

  attr_writer :original_row

  attr_accessor :row_with_intervals

  def create_list_with_intervals(row, first_pitch)
    row_list = row.each_with_object({}) do |pitch, hash|
      distance = first_pitch.distance_from pitch
      validate_uniqueness_of distance, hash
      hash[distance] = pitch
    end
    finalize_pitches(row_list)
  end

  def finalize_pitches(row_list)
    row_list[12] = starting_pitch
    row_list
  end

  def starting_pitch
    original_row[0]
  end

  def create_row_with_pitches tone_row
    tone_row.each_with_object([]) do |pitch, row|
      row << Pitch.new(pitch)
    end
  end

  def validate_size_of row
    row_size = row.to_set.length
    unless row_size == 12
      raise ArgumentError, "incorrect number of pitches (#{row_size}) in row"
    end
  end

  def validate_uniqueness_of distance, hash
    if hash.has_key? distance
      raise ArgumentError, "duplicate pitch (#{hash[distance].name})"
    end
  end

  def normalize_row message
   original_row.each_with_object([]) do |pitch, row|
     row << pitch.send(message)
    end
  end

  def transpose interval, pitch
    (starting_pitch.distance_from(pitch) + interval) % 12
  end

end

require_relative 'pitch'

class Dodecaphony

  attr_reader :original_row

  def initialize tone_row
    self.original_row = create_row_with_pitches tone_row
    self.row_with_intervals = original_row.each_with_object({}) do |pitch, hash|
      hash[(starting_pitch.distance_from pitch)] = pitch
    end
  end

  def spell_with_sharps
    normalize_row :spell_as_sharp
  end

  def spell_with_flats
    normalize_row :spell_as_flat
  end

  (0..11).each do |i|
    define_method "p#{i}".to_sym do
      original_row.each_with_object([]) do |pitch, row|
        row << row_with_intervals[(transpose i, pitch)].name
      end
    end
  end

  private

  attr_writer :original_row

  attr_accessor :row_with_intervals

  def starting_pitch
    original_row[0]
  end

  def create_row_with_pitches tone_row
    tone_row.each_with_object([]) do |pitch, row|
      row << Pitch.new(pitch)
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

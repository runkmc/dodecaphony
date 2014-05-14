require_relative 'pitch'

class Dodecaphony

  attr_reader :original_row

  def initialize tone_row
    self.original_row = create_row_with_pitches tone_row
  end

  def spell_with_sharps
    normalize_row :spell_as_sharp
  end

  def spell_with_flats
    normalize_row :spell_as_flat
  end

  def p0
    original_row.each_with_object([]) do |pitch, row|
      row << pitch.name
    end
  end

  private

  attr_writer :original_row

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


end

require_relative 'pitch'

class Dodecaphony

  attr_reader :original_row

  def initialize tone_row, spelling=:sharps
    self.original_row = tone_row
    self.normalized_row = normalize_row spelling: spelling
  end

  def p0
    normalized_row
  end

  private

  def normalize_row sharps=true
    row = get_pitches
    row.each_with_object([]) do |pitch, a|
      a << (sharps ? pitch.spell_as_sharp : pitch.spell_as_flat)
    end
  end

  def get_pitches
    original_row.each_with_object([]) do |pitch_name, a|
      a << Pitch.new(pitch_name)
    end
  end

  attr_reader :normalized_row

  attr_writer :original_row, :normalized_row

end

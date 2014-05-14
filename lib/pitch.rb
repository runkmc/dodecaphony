class Pitch

  attr_reader :name

  def initialize pitch_name
    self.name = pitch_name
    self.pitch_number = generate_pitch_number self.name
  end

  def distance_from second_pitch
    (pitch_number - second_pitch.pitch_number).abs
  end

  def spell_as_sharp
    case pitch_number
    when 0 then "A"
    when 1 then "A#"
    when 2 then "B"
    when 3 then "C"
    when 4 then "C#"
    when 5 then "D"
    when 6 then "D#"
    when 7 then "E"
    when 8 then "F"
    when 9 then "F#"
    when 10 then "G"
    when 11 then "G#"
    end
  end

  def spell_as_flat
    case pitch_number
    when 0 then "A"
    when 1 then "Bb"
    when 2 then "B"
    when 3 then "C"
    when 4 then "Db"
    when 5 then "D"
    when 6 then "Eb"
    when 7 then "E"
    when 8 then "F"
    when 9 then "Gb"
    when 10 then "G"
    when 11 then "Ab"
    end
  end

  protected

  attr_reader :pitch_number

  private

  def generate_pitch_number pitch_string
    number = starting_letter_name
    if accidentals
      number = adjust_for_accidentals(number)
    end
    number
  end

  def accidentals
    name.downcase.split(//)[1..-1]
  end

  def adjust_for_accidentals number
    accidentals.each do |a|
      number += 1 if a == '+' or a == '#'
      number -= 1 if a == '-' or a == 'b' 
    end
    ensure_number_scale number
  end

  def ensure_number_scale number
    number % 12
  end

  def starting_letter_name
    case name.upcase.split(//)[0]
    when 'A' then 0
    when 'B' then 2
    when 'C' then 3
    when 'D' then 5
    when 'E' then 7
    when 'F' then 8
    when 'G' then 10
    end
  end

  attr_writer :name, :pitch_number

end

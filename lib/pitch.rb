class Pitch

  attr_reader :name

  VALID_PITCHES = {'A' => 0, 'B' => 2, 'C' => 3, 'D' => 5,
                   'E' => 7, 'F' => 8, 'G' => 10}

  def initialize pitch_name
    self.name = pitch_name
    self.pitch_number = generate_pitch_number self.name
  end

  def distance_from second_pitch
    ensure_number_scale(second_pitch.pitch_number - pitch_number)
  end

  def spell_as_sharp num=self.pitch_number
    if VALID_PITCHES.has_value? num
      VALID_PITCHES.key(num)
    else
      "#{VALID_PITCHES.key(ensure_number_scale(num - 1))}#"
    end
  end

  def spell_as_flat num=self.pitch_number
    if VALID_PITCHES.has_value? num
      VALID_PITCHES.key(num)
    else
      "#{VALID_PITCHES.key(ensure_number_scale(num + 1))}b"
    end
  end

  protected

  attr_reader :pitch_number

  private

  attr_writer :name, :pitch_number

  def generate_pitch_number pitch_string
    adjust_for_accidentals(starting_letter_name) if accidentals
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
    VALID_PITCHES[name.upcase.split(//)[0]]
  end

end

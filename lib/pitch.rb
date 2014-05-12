class Pitch

  attr_reader :name

  def initialize pitch_name
    self.name = pitch_name
    self.pitch_number = generate_pitch_number self.name
  end

  def distance_from second_pitch
    (pitch_number - second_pitch.pitch_number).abs
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
    if number < 0
      number += 12
    elsif number > 12
      number -= 12
    end
    number
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

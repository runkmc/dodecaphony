class Pitch

  attr_reader :name

  def initialize pitch_name
    self.name = pitch_name
    self.pitch_number = generate_pitch_number self.name
  end

  def distance_from second_pitch
    3
  end

  private

  attr_writer :name, :pitch_number

  def letter_name pitch_string
  end

  def generate_pitch_number pitch_string
    case pitch_string.upcase[1]
    when 'A' then 0
    when 'B' then 2
    when 'C' then 3
    when 'D' then 5
    when 'E' then 7
    when 'F' then 8
    when 'G' then 10
    end
  end

end

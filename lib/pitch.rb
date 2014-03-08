class Pitch

  attr_reader :name

  def initialize pitch_name
    self.name = pitch_name    
  end

  def distance_from second_pitch
    3
  end

  private

  attr_writer :name

end

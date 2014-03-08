class Pitch

  attr_reader :name

  def initialize pitch_name
    self.name = pitch_name    
  end

  private

  attr_writer :name

end

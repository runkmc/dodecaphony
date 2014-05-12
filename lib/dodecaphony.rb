class Dodecaphony

  attr_reader :original_row

  def initialize tone_row
    self.original_row = tone_row
  end

  private

  attr_writer :original_row

end

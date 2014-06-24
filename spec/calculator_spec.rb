require 'calculator'
require 'ostruct'

describe Dodecaphony::Calculator do
  it "initializes with a row" do
    row = Dodecaphony::Row.new %w[a b b- c c# d d# e f gb g g#]
    calc = Dodecaphony::Calculator.new row
    
    expect(calc).to be_kind_of(Dodecaphony::Calculator)
  end

end

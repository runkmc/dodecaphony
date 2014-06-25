require 'calculator'
require 'ostruct'

describe Dodecaphony::Calculator do

  it "initializes with a row" do
    row = Dodecaphony::Row.new %w[a b b- c c# d d# e f gb g g#]
    calc = Dodecaphony::Calculator.new row
    
    expect(calc).to be_kind_of(Dodecaphony::Calculator)
  end

  it "can provide the original row" do
    row = Dodecaphony::Row.new %w[a b b- c c# d d# e f gb g g#]
    calc = Dodecaphony::Calculator.new row

    expect(calc.p0).to eq row
  end

  xit "can provide p1" do
    row = Dodecaphony::Row.new %w[ bb b c c# d f e eb g gb a ab ]
    p1_row = Dodecaphony::Row.new %w[ b c c# d eb gb f e ab g bb a ]
    calc = Dodecaphony::Calculator.new row

    expect(calc.p1.to_s).to eq p1_row.to_s
  end

end

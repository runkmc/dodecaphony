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

    expect(calc.p0).to eq row.to_a
  end

  it "can provide p1" do
    row = Dodecaphony::Row.new %w[ bb b c c# d f e eb g gb a ab ]
    p1_row = %w[ b c c# d eb gb f e ab g bb a ]
    calc = Dodecaphony::Calculator.new row

    expect(calc.p1).to eq p1_row.to_a
  end

   it "can give p7" do
     row = Dodecaphony::Row.new %w[ d c# a b- f eb e c ab g f# b ]
     prime7 = %w[ a ab e f c b- b g eb d c# f# ]
     calc = Dodecaphony::Calculator.new row
       
     expect(calc.p7).to eq prime7
   end
  
  it "can give i0" do
    row = Dodecaphony::Row.new %w[ A ab a# b c c# d eb e f gb g ]
    new_row = %w[ A a# ab g gb f e eb d c# c b ]
    calc = Dodecaphony::Calculator.new row

    expect(calc.i0).to eq new_row
  end

  it "can give i8" do
    row = Dodecaphony::Row.new %w[ A ab a# b c c# d eb e f gb g ]
    new_row = %w[ f gb e eb d c# c b a# A ab g ]
    calc = Dodecaphony::Calculator.new row

    expect(calc.i8).to eq new_row
  end

  it "can give r0" do
    row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]
    new_row = %w[ eb c c# d bb b f e ab g f# a ]
    calc = Dodecaphony::Calculator.new row

    expect(calc.r0).to eq new_row
  end

  it "can give r9" do
    row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]
    new_row = %w[ c a bb b g ab d c# f e eb f# ]
    calc = Dodecaphony::Calculator.new row

    expect(calc.r9).to eq new_row
  end

  it "can give ri0" do
    row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]
    new_row = Dodecaphony::Row.new %w[eb f# f e ab g c# d bb b c a ] 
    calc = Dodecaphony::Calculator.new row

    expect(calc.ri0).to eq new_row
  end

  it "can give ri11" do
    row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]
    new_row = Dodecaphony::Row.new %w[ c# e eb d f# f b c ab a bb g ]
    calc = Dodecaphony::Calculator.new row

    expect(calc.ri10).to eq new_row
  end

end

require 'dodecaphony'

describe Dodecaphony do

  let(:testing_row) { Dodecaphony.new %w[ d c# a b- f eb e c ab g f# b ] }
  
  it "initializes with an array of strings and returns the original row" do
    tone_row = %w[ a a# b c db d eb e f f# g g# ]
    new_dod = Dodecaphony.new tone_row

    expect(new_dod.p0).to eq tone_row
  end

  it "can respell the row, favoring sharps" do
    tone_row = %w[ c c+ d d# fb f gb g a- b-- bb b ]
    new_dod = Dodecaphony.new tone_row 

    expect(new_dod.spell_with_sharps).to eq %w[ C C# D D# E F F# G G# A A# B ]
  end

  it "can respell the row, favoring flats" do
    tone_row = %w[ c c+ d d# fb f gb g a- b-- bb b ]
    new_dod = Dodecaphony.new tone_row
    
    expect(new_dod.spell_with_flats).to eq %w[ C Db D Eb E F Gb G Ab A Bb B ]
  end

  it "can give p1" do
    tone_row = %w[ bb b c c# d f e eb g gb a ab ]
    new_dod = Dodecaphony.new tone_row

    expect(new_dod.p1).to eq %w[ b c c# d eb gb f e ab g bb a ]
  end

  it "can give p7" do
    expect(testing_row.p7).to eq %w[ a ab e f c b- b g eb d c# f# ]
  end
end

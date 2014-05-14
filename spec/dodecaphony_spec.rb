require 'dodecaphony'

describe Dodecaphony do

  it "initializes with an array of strings and returns the same value" do
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

end

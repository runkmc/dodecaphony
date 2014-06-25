require 'row'

describe Dodecaphony::Row do

  it "initializes with an array of strings and returns the original row" do
    tone_row = %w[ a a# b c db d eb e f f# g g# ]
    new_dod = Dodecaphony::Row.new tone_row

    expect(new_dod.to_a).to eq tone_row
  end

  it "raises an error for a row with more than 12 pitches" do
    expect{ Dodecaphony::Row.new %w[ a a# b c c# d eb e f f# g ab a] }.
      to raise_error(ArgumentError, 'incorrect number of pitches (13) in row')
  end

  it "raises an error for a row with less than 12 pitches" do
    expect{ Dodecaphony::Row.new %w[ a a# b eb e f f# g ab a] }.
      to raise_error(ArgumentError, 'incorrect number of pitches (10) in row')
  end
  
  it "raises an error for duplicate pitches" do
    expect{ Dodecaphony::Row.new %w[a a# b c c# d eb e f f g ab]}.
      to raise_error(ArgumentError, 'duplicate pitch (f)')
  end

  it "can respell the row, favoring sharps" do
    tone_row = %w[ c c+ d d# fb f gb g a- b-- bb b ]
    new_dod = Dodecaphony::Row.new tone_row 

    expect(new_dod.spell_with_sharps).to eq %w[ C C# D D# E F F# G G# A A# B ]
  end

  it "can respell the row, favoring flats" do
    tone_row = %w[ c c+ d d# fb f gb g a- b-- bb b ]
    new_dod = Dodecaphony::Row.new tone_row
    
    expect(new_dod.spell_with_flats).to eq %w[ C Db D Eb E F Gb G Ab A Bb B ]
  end

  it "returns a reasonable string" do
    tone_row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]

    expect(tone_row.to_s).to eq "a f# g ab e f b bb d c# c eb"
  end

  it "returns an array" do
    tone_row = Dodecaphony::Row.new %w[a f# g ab e f b b- d c# c eb]

    expect(tone_row.to_a).to eq %w[a f# g ab e f b b- d c# c eb]
  end

  it "returns its pitches" do
    tone_row = Dodecaphony::Row.new %w[a f# g ab e f b b- d c# c eb]
    first_pitch = Dodecaphony::Pitch.new "a"

    expect(tone_row.pitches.to_a[0].name).to eq first_pitch.name
  end

  it "can check for equality with other rows" do
    row1 = Dodecaphony::Row.new %w[a f# g ab e f b b- d c# c eb]
    row2 = Dodecaphony::Row.new %w[a f# g ab e f b b- d c# c eb]

    expect(row1).to eq row2
  end

  it "knows when rows are unequal" do
    row1 = Dodecaphony::Row.new %w[a f# g ab e f b b- d c# c eb]
    row2 = Dodecaphony::Row.new %w[a b b- c d- d e- e f g- g a-]

    expect(row1).to_not eq row2
  end
end

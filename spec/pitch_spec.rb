require 'pitch'

describe Dodecaphony::Pitch do

  it "can tell you its pitch name" do
    pitch = Dodecaphony::Pitch.new "A"

    expect(pitch.name).to eq "A"
  end

  it "can tell you its distance from another pitch" do
    first_pitch = Dodecaphony::Pitch.new "d"
    second_pitch = Dodecaphony::Pitch.new "f"

    expect(first_pitch.distance_from second_pitch).to eq 3
  end

  it "responds with the ascending distance, not an inversion for length" do
    first_pitch = Dodecaphony::Pitch.new "f"
    second_pitch = Dodecaphony::Pitch.new "e"

    expect(first_pitch.distance_from second_pitch).to eq 11
  end

  it "understands unusual pitch names" do
    first_pitch = Dodecaphony::Pitch.new "fb"
    second_pitch = Dodecaphony::Pitch.new "A+++"

    expect(first_pitch.distance_from second_pitch).to eq 8
  end

  it "understands more unusual pitch names" do
    first_pitch = Dodecaphony::Pitch.new "g#####"
    second_pitch = Dodecaphony::Pitch.new "C"

    expect(first_pitch.distance_from second_pitch).to eq 0
  end

  it "can respell pitch as a normalized sharp" do
    pitch = Dodecaphony::Pitch.new "G++++++"

    expect(pitch.spell_as_sharp).to eq "C#"
  end

  it "can respell pitch as a normalized flat" do
    pitch = Dodecaphony::Pitch.new "c###"

    expect(pitch.spell_as_flat).to eq "Eb"
  end

  it "raises an error with an invalid pitch name" do
    expect {Dodecaphony::Pitch.new "H"}.to raise_error(ArgumentError, 'invalid pitch name')
  end
end

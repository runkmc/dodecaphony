require 'pitch'

describe Pitch do

  it "can tell you its pitch name" do
    pitch = Pitch.new "A"

    expect(pitch.name).to eq "A"
  end

  it "can tell you its distance from another pitch" do
    first_pitch = Pitch.new "d"
    second_pitch = Pitch.new "f"

    expect(first_pitch.distance_from second_pitch).to eq 3
  end

  it "responds with the ascending distance, not an inversion for length" do
    first_pitch = Pitch.new "f"
    second_pitch = Pitch.new "e"

    expect(first_pitch.distance_from second_pitch).to eq 11
  end

  it "understands unusual pitch names" do
    first_pitch = Pitch.new "fb"
    second_pitch = Pitch.new "A+++"

    expect(first_pitch.distance_from second_pitch).to eq 8
  end

  it "understands more unusual pitch names" do
    first_pitch = Pitch.new "g#####"
    second_pitch = Pitch.new "C"

    expect(first_pitch.distance_from second_pitch).to eq 0
  end

  it "can respell pitch as a normalized sharp" do
    pitch = Pitch.new "G++++++"

    expect(pitch.spell_as_sharp).to eq "C#"
  end

  it "can respell pitch as a normalized flat" do
    pitch = Pitch.new "c###"

    expect(pitch.spell_as_flat).to eq "Eb"
  end

  it "raises an error with an invalid pitch name" do
    expect {Pitch.new "H"}.to raise_error(ArgumentError, 'invalid pitch name')
  end
end

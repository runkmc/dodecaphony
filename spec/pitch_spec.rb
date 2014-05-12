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

  it "responds with the shortest distance between two pitches" do
    first_pitch = Pitch.new "f"
    second_pitch = Pitch.new "c"

    expect(first_pitch.distance_from second_pitch).to eq 5
  end

  it "understands unusual pitch names" do
    first_pitch = Pitch.new "fb"
    second_pitch = Pitch.new "A+++"

    expect(first_pitch.distance_from second_pitch).to eq 4
  end

  it "understands edge case pitch names are equal" do
    first_pitch = Pitch.new "g#####"
    second_pitch = Pitch.new "C"

    expect(first_pitch.distance_from second_pitch).to eq 0
  end
end

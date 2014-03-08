require 'pitch'

describe Pitch do

  it "exists" do
    pitch = Pitch.new "C#"

    expect(pitch).to be_kind_of Pitch
  end

  it "can tell you its pitch name" do
    pitch = Pitch.new "A"

    expect(pitch.name).to eq "A"
  end

  it "can tell you its distance from another pitch" do
    first_pitch = Pitch.new "d"
    second_pitch = Pitch.new "f"

    expect(first_pitch.distance_from second_pitch).to eq 3
  end

end

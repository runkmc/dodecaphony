require 'pitch'

describe Pitch do

  it "exists" do
    pitch = Pitch.new("C#")

    expect(pitch).to be_kind_of Pitch
  end

  it "can tell you its pitch name" do
    pitch = Pitch.new("A")

    expect(pitch.name).to eq "A"
  end

end

require 'pitch'

describe Pitch do

  it "exists" do
    pitch = Pitch.new("C#")

    expect(pitch).to be_kind_of Pitch
  end

end

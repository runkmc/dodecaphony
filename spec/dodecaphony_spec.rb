require 'dodecaphony'

describe Dodecaphony do

  it "initializes with an array of strings and returns the same value" do
    tone_row = %w[ a a# b c db d eb e f f# g g# ]
    new_dod = Dodecaphony.new tone_row

    expect(new_dod.original_row).to eq tone_row
  end
end

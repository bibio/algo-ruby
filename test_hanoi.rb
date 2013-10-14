require 'hanoi'

describe "test_hanoi" do
  it "test" do
    h = Hanoi.new(5)
    h.solve
    expect(h.C).to eq([1,2,3,4,5])
    expect(h.A).to eq([])
    expect(h.B).to eq([])
  end
end

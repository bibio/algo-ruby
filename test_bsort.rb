require 'bsort'

include BubbleSort

describe "test" do
  it "t1" do
    expect(bubblesort2([3,1,2])).to eq([1,2,3])
  end
end

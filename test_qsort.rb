require 'qsort'

describe "test qsort" do
  it "1 array" do
    ar = [9]
    ar.quicksort
    expect(ar).to eq([9])
  end
  it "2 array" do
    ar = [8,7]
    ar.quicksort
    expect(ar).to eq([7,8])
  end
  it "3 array" do
    ar = [3,2,1]
    ar.quicksort
    expect(ar).to eq([1,2,3])
  end
  it "4 array" do
    ar = [8,3,19,1,5,2]
    ar.quicksort
    expect(ar).to eq([1,2,3,5,8,19])
  end
  it "10 array" do
    ar = [10,9,8,7,6,5,4,3,2,1]
    ar.quicksort
    expect(ar).to eq([1,2,3,4,5,6,7,8,9,10])
  end
  it "1 array(string)" do
    ar = ["aaa"]
    ar.quicksort
    expect(ar).to eq(["aaa"])
  end
  it "2 array(string)" do
    ar = ["bbb","aaa"]
    ar.quicksort
    expect(ar).to eq(["aaa","bbb"])
  end
  it "3 array(string)" do
    ar = ["ccc","bbb","aaa"]
    ar.quicksort
    expect(ar).to eq(["aaa","bbb","ccc"])
  end
end

describe "test qsort2" do
  it "data1" do
    expect([9].quicksort2).to eq([9])
  end
  it "data2" do
    expect([9,8,7,6,5].quicksort2).to eq([5,6,7,8,9])
  end
  it "data3" do
    expect([3,1,3].quicksort2).to eq([1,3,3])
  end
end

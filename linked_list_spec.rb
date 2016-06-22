require 'pry'
require_relative 'linked_list'

describe LinkedList do

  let(:test_list) { LinkedList.new }

  it "instantiates a new object of type LinkedList" do
    expect(test_list).to be_a(LinkedList)
  end

  it "adds a new node as the first node on the list" do
    test_list.insert_first("data")
    expect(test_list.first.value).to eq("data")
  end

  it "reassigns linkages when new nodes are added as the first" do
    test_list.insert_first("data")
    test_list.insert_first("tata")
    expect(test_list.first.value).to eq("tata")
  end

  it "removes the first link and reassigns the first slot to the next following one" do
    test_list.insert_first("data")
    test_list.insert_first("tata")
    test_list.remove_first
    expect(test_list.first.value).to eq("tata")
  end

  it "finds the last node in the linked list" do
    test_list.insert_first("data")
    test_list.insert_first("tata")
    expect(test_list.find_last.value).to eq("data")
  end

  it "inserts a value and makes it the final value in the list" do
    test_list.insert_last("stuff")
    expect(test_list.find_last.value).to eq("stuff")
  end

  it "removes the last value from the linked list" do
    test_list.insert_last("cat")
    expect(test_list.remove_last).to eq(nil)
  end

  it "retrieves an element at a particular index" do
    test_list.insert_first("Neutral Milk Hotel")
    test_list.insert_first("Dan Deacon")
    # expect(test_list.get(1).value).to eq("Dan Deacon")
    expect(test_list.get(1).value).to eq("Neutral Milk Hotel")
    # binding.pry
  end

end

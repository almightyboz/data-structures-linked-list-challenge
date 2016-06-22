# require 'pry'
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

  it "removes the first node and reassigns it's pointer to the next following one" do
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

  it "inserts a value as a node and makes it the final value in the list" do
    test_list.insert_last("stuff")
    expect(test_list.find_last.value).to eq("stuff")
  end

  it "removes the last node from an otherwise empty linked list" do
    test_list.insert_last("cat")
    test_list.remove_last
    expect(test_list.empty?).to eq(true)
    expect(test_list.get(0)).to eq(nil)
  end

  it "removes the last node from a linked list with more than one node" do
    test_list.insert_first("data")
    test_list.insert_first("tata")
    test_list.insert_last("rata")
    expect(test_list.size).to eq(3)
    test_list.remove_last
    expect(test_list.get(1).value).to eq("data")
    expect(test_list.size).to eq(2)
  end

  it "retrieves an node at a particular index" do
    test_list.insert_first("Neutral Milk Hotel")
    test_list.insert_first("Dan Deacon")
    expect(test_list.get(1).value).to eq("Neutral Milk Hotel")
  end

  it "sets the value at a certain index" do
    test_list.insert_first("emily")
    test_list.insert_first("claire")
    test_list.set(1, "data")
    expect(test_list.get(1).value).to eq("data")
  end

  it "inserts a new element as a node at a certain index" do
    test_list.insert_first("data")
    test_list.insert_first("tata")
    test_list.insert(1, "octopus")
    expect(test_list.get(1).value).to eq "octopus"
    expect(test_list.get(0).value).to eq "tata"
    expect(test_list.get(2).value).to eq "data"
  end

  it "returns the number of nodes in the list" do
    test_list.insert_first("stuff")
    test_list.insert_last("more stuff")
    expect(test_list.size).to eq(2)
    test_list.insert_first("yet more stuff")
    expect(test_list.size).to eq(3)
  end

end

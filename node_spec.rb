require_relative 'node'

describe Node do

  let(:test_node) { Node.new("data") }
  let(:other_node) { Node.new("linkage") }
  let(:third_node) { Node.new("testage") }

  it "instantiates a new object of a type Node with a value" do
    expect(test_node).to be_a Node
    expect(test_node.value).not_to eq("frog")
    expect(test_node.value).to eq("data")
  end

  it "links the object to another node object" do
    expect(test_node.front_pointer).to be(nil)
    expect(test_node.back_pointer).to be(nil)
    test_node.assign_front_pointer(other_node)
    other_node.assign_back_pointer(test_node)
    expect(test_node.front_pointer).to be_a Node
    expect(test_node.front_pointer.value).to eq("linkage")
  end

  it "reassigns the pointer of the node being moved around" do
    test_node.assign_front_pointer(other_node)
    other_node.assign_back_pointer(test_node)
    test_node.insert_after(third_node)
    expect(test_node.front_pointer).to eq(third_node)
    expect(third_node.front_pointer).to eq(other_node)
    expect(third_node.back_pointer).to eq(test_node)
    expect(other_node.back_pointer).to eq(third_node)
  end

  it "removes the linkage" do
    test_node.assign_front_pointer(other_node)
    expect(test_node.front_pointer).to be_a Node
    expect(test_node.front_pointer.value).to eq("linkage")
    test_node.remove_after
    expect(test_node.front_pointer).to be(nil)
  end

end

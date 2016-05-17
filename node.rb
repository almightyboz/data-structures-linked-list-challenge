class Node

  attr_accessor :front_pointer, :back_pointer
  attr_reader :value

  def initialize(element)
    @value = element
    @front_pointer = nil
    @back_pointer = nil
  end

  # from perspective of node being inserted
  def insert_after(other_node)
    back_node = other_node
    front_node = other_node.front_pointer

    @front_pointer = front_node
    @back_pointer = back_node


  end

  def remove_after
    @front_pointer = nil
  end

  def remove_before
    @back_pointer = nil
  end

end

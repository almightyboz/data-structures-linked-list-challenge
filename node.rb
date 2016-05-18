class Node

  attr_accessor :front_pointer, :back_pointer
  attr_reader :value

  def initialize(element)
    @value = element
    @front_pointer = nil
    @back_pointer = nil
  end

  def insert_after(x)
    a = self
    b = a.front_pointer

    # back_node = x
    # front_node = x.front_pointer

    @front_pointer = front_node
    @back_pointer = back_node

    front_node.reassign_front_pointer(self)
  end

  def reassign_back_pointer(other_node)
    @front_pointer = other_node
  end

  def reassign_front_pointer(other_node)
    @back_pointer = other_node
  end

  def remove_after
    @front_pointer = nil
  end

  def remove_before
    @back_pointer = nil
  end

end

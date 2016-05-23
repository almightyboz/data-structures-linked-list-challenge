require 'pry'

class Node

  attr_accessor :front_pointer, :back_pointer
  attr_reader :value

  def initialize(element)
    @value = element
    @front_pointer = nil
    @back_pointer = nil
  end

  # PROBLEMS WITH THIS METHOD
  # cannot call assign_back_pointer if there isn't already a pointer there
  # BUT WHY THO
  # ANSWER(?) THAT'S THE LL's respnosibility
  def insert_after(other_node)
    # don't need to change @back_pointer
    #x = to be inserted
    # a = self
    b = a.front_pointer

    b.assign_back_pointer(other_node)
    other_node.assign_front_pointer(b)
    @front_pointer = other_node
    other_node.assign_back_pointer(self)
  end

  def assign_back_pointer(other_node)
    @back_pointer = other_node
  end

  def assign_front_pointer(other_node)
    @front_pointer = other_node
  end

  def remove_after
    @front_pointer = nil
  end

  def remove_before
    @back_pointer = nil
  end

end

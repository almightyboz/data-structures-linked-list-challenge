require_relative 'node'
# how should i handle empty lists?
class LinkedList

  attr_reader :first

  def initialize()
    @first = nil
  end

  def insert_first(element)
    if @first
      new_first = Node.new(element)
      new_first.assign_front_pointer(@first)
      @first.assign_back_pointer(new_first)
      @first = new_first
    else
      @first = Node.new(element)
    end
  end

  def remove_first
    @first = @first.front_pointer
  end

  # recursion, be careful
  def find_last(node=@first)
    if node.front_pointer == nil
      return node
    else
      node = node.front_pointer
      find_last(node)
    end
  end

  def empty?
    @first.nil?
  end

  def insert_last(element)
    if empty?
      insert_first(element)
    else
      last_node = find_last()
      last_node.insert_after(Node.new(element))
    end
  end

  def remove_last
    unless empty?
      last_node = find_last()
      last_node.remove_after
    end
  end

  def get(index, node=@first)
    counter = 0
    if counter == index
      return node
    else
      counter += 1
      node = node.front_pointer
      get(index, node)
    end
  end

  def set(index, element)
  end

  def insert(index, element)
  end

end

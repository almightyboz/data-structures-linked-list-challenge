require_relative 'node'

class LinkedList

  attr_reader :first

  def initialize()
    @first = nil
  end

  def insert_first(element)
    new_first = Node.new(element)
    new_first.front_pointer = @first
    @first = new_first
  end

  def remove_first
    @first = @first.front_pointer
  end

  # unfuck recursion?
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

  # find penultimate?
  def remove_last
    unless empty?

    end
  end

end

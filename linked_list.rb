require_relative 'node'
# how should i handle empty lists?
class LinkedList

  attr_reader :first, :size

  def initialize()
    @first = nil
    @size = 0
  end

  # can I make this faster/better?
  def insert_first(element)
    if @first
      new_first = Node.new(element)
      new_first.insert_after(@first)
      @first = new_first
    else
      @first = Node.new(element)
    end
    @size += 1
  end

  def remove_first
    front = @first.front_pointer
    @first.remove_after
    front = @first
    @size -= 1
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
    @size += 1
  end

  # can I remove the if loop around the penultimate node?
  def remove_last
    unless empty?
      last_node = find_last()
      # doesn't work if the list only has 1 node
      # last_node.remove_before
      penultimate_node = last_node.back_pointer
      if penultimate_node
        penultimate_node.remove_after
      else
        @first = nil
      end
    end
    @size -= 1
  end

  # output is the particular node object
  def get(index, node=@first, counter=0)
    validate_command(index)
    counter = counter
    if counter == index
      return node
    else
      counter += 1
      node = node.front_pointer
      get(index, node, counter)
    end
  end

  # prevent monkeyshines if the user enters an index that doesnot exist
  # better as boolean?
  def validate_command(index)
    if index > @size
      raise StandardError, "The specified index does not exist"
    end
  end

  # replaces value, keeps other aspect of node the same
  def set(index, element)
    validate_command(index)
    node_to_change = get(index)
    node_to_change.value = element
  end

  # inserts a new node instance into the list
  def insert(index, element)
    validate_command(index - 1)
    node_to_insert = Node.new(element)
    bump_down = self.get(index - 1)
    bump_down.insert_after(node_to_insert)
    @size += 1
  end

end

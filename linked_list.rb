# require 'pry'
require_relative 'node'
# how should i handle empty lists?
class LinkedList

  attr_reader :first

  def initialize()
    @first = nil
  end

  # can I make this faster/better?
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
    front = @first.front_pointer
    @first.remove_after
    front = @first
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

  # output is the particular node object
  def get(index, node=@first, counter=0)
    counter = counter
    if counter == index
      return node
    else
      counter += 1
      node = node.front_pointer
      get(index, node, counter)
    end
  end

  def set(index, element)
    node_to_change = get(index)
    node_to_change.value = element
  end

  def insert(index, element)
    node_to_insert = Node.new(element)
    bump_down = self.get(index - 1)
    bump_down.insert_after(node_to_insert)
  end

end

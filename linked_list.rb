require "byebug"

class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def node_factory(value = nil)
    Node.new(value)
  end

  def prepend_node(node_value)
    node = node_factory(node_value)
    if @head.nil?
      @head = node
      @tail = node
      @head.next_node = @tail
    else
      node.next_node = @head
      @head = node
    end
  end

  def append_node(node_value, current_node = head)
    if @head.nil?
      node = node_factory(node_value)
      @head = node
      @tail = node
    elsif current_node == @tail && current_node.next_node.nil?
      node = node_factory(node_value)
      current_node.next_node = node
      @tail = node
    else
      append_node(node_value, current_node.next_node)
    end
  end

  def insert_at(node_value, index, current_node = head)
    if index == 0 && current_node == @head
      prepend_node(node_value)
    elsif index == 1 && current_node.next_node == @tail
      node = node_factory(node_value)
      current_node.next_node = node
      current_node.next_node.next_node = @tail
    elsif index == 1 && current_node.next_node != @tail
      old_next_node = current_node.next_node.clone
      node = node_factory(node_value)
      current_node.next_node = node
      current_node.next_node.next_node = old_next_node
    elsif index < 0
      return puts "Index must be positive"
    else
      insert_at(node_value, index - 1, current_node.next_node)
    end
  end

  def remove_at(index, current_node = head)
    if index == 0 && current_node == @head
      current_node.next_node = @head
    elsif index == 1 && current_node.next_node == @tail
      current_node.next_node = nil
      @tail = current_node
    elsif index == 1 && current_node.next_node != @tail
      new_next_node = current_node.next_node.next_node
      current_node.next_node = new_next_node
    elsif index < 0
      return puts "Index must be positive"
    else
      remove_at(index - 1, current_node.next_node)
    end
  end

  def at(index, current_node = head)
    return current_node if index == 0
    return puts "Index must be positive" if index < 0
    at(index - 1, current_node.next_node)
  end

  def contains?(value, current_node = head)
    return true if current_node.value == value
    return false if current_node == @tail
    contains?(value, current_node.next_node)
  end

  def find(value, current_index = 0, current_node = head)
    return current_index if current_node.value == value
    return puts "Value not found in list" if current_node == @tail
    find(value, current_index + 1, current_node.next_node)
  end

  def size(current_node = head, count = 1)
    return 0 if head.nil?
    return count if current_node == tail
    count += 1
    size(current_node.next_node, count)
  end

  def pop(current_node = head)
    if @head.nil?
      return nil
    elsif current_node.next_node == @tail
      old_tail = @tail
      current_node.next_node = nil
      @tail = current_node
      return old_tail
    end
    pop(current_node.next_node)
  end

  def to_s(current_node = head)
    print "(#{current_node.value})" + " -> "
    return print "nil\n" if current_node.next_node.nil?
    to_s(current_node.next_node)
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
    @next_node = nil
  end
end

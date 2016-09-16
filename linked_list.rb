class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def node_factory(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def prepend(node_value)
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

  def append(node_value)
    node = node_factory(node_value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def insert_at(node_value, index, current_node = head)
    if index == 1
      old_next_node = current_node.next_node
      current_node.next_node = node_factory(node_value, old_next_node)
    elsif index < 0
      return puts "Index must be positive"
    else
      insert_at(current_node.next_node, index - 1, current_node)
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
  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

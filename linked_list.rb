class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def node_factory(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end
end

class Node
  attr_reader :value, :next_node
  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

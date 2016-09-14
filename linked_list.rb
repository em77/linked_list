class LinkedList
  attr_reader :head, :tail
  def initialize
    @tail = node_factory("tail")
    @head = node_factory("head", tail)
  end

  def node_factory(value = nil, next_node = nil)
    Node.new(value, next_node)
  end
end

class Node
  attr_reader :value, :next_node
  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

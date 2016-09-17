## Linked Lists in Ruby
#### Implementation of linked lists in Ruby with basic expected methods

Example:
`> list = LinkedList.new`
`> list.append_node("first node")`
`> list.append_node("second node")`
`> list.to_s`
`=> (first node) -> (second node) -> nil`

#### Available methods

`#append(value)` adds a new node to the end of the list
`#prepend(value)` adds a new node to the start of the list
`#size` returns the total number of nodes in the list
`#head` returns the first node in the list
`#tail` returns the last node in the list
`#at(index)` returns the node at the given index
`#pop` removes the last node from the list, and returns the removed node
`#contains?` returns true if the passed in value is in the list and otherwise returns false.
`#find(value)` returns the index of the node containing the value, or nil if not found.
`#to_s` gives representation of LinkedList objects as strings.
`#insert_at(value, index)` inserts the new node with given value at the given index
`#remove_at(index)` removes the node at the given index.

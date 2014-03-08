class Node
  attr_accessor :next, :value
  def initialize(value)
    @value = value
    @next = nil
  end
end

class List
  attr_accessor :head, :tail
  def initialize
    @tail = nil
    @head = nil
  end

  # def build_list
  # end

  def puts_list
    node = self.head
    while node != nil
      puts node.value
      node = node.next
    end
  end

  def add_node_to_tail(node)
    if self.head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def switcharoo
    return "No nodes in list" if self.head.nil?
    first_node = self.head
    buddy_node = first_node.next
    until buddy_node == nil
      first_node.value, buddy_node.value = buddy_node.value, first_node.value
      first_node = buddy_node.next
      if first_node
        buddy_node = first_node.next
      else
        first_node, buddy_node = nil
      end
    end
  end
end

puts "Demoing construction of a singularly linked list"
linked_list = List.new

6.times do |c|
  linked_list.add_node_to_tail(Node.new(c))
end
puts
linked_list.puts_list
puts

puts "Demoing the construction of switching every sequential pairing"

puts "Expecting it to print out 1 0 3 2 5 4"
puts
linked_list.switcharoo

linked_list.puts_list
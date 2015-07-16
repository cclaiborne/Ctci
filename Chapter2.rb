class Node
   attr_accessor :data, :next
   def initialize(d = nil, n = nil)
      @data = d
      @next = n
   end
end

class Chapter2
  require 'set'
  #remove duplicates from an unsorted linked list
  def two_point_one(head)
    @s1 = Set.new
    @current = head
    while(@current.next != nil)
      if(@s1.include?(@current.next.data))
        @current.next = @current.next.next
      else
        @s1.add(@current.data)
      end
      @current = @current.next
    end
    return head
  end
end

n1 = Node.new("a", nil)
n2 = Node.new("b", nil)
n3 = Node.new("a", nil)
n4 = Node.new("c", nil)

n1.next = n2
n2.next = n3
n3.next = n4

c2 = Chapter2.new
duplicates_removed = c2.two_point_one(n1)
#n3 should be removed, thus n4 is printed
puts duplicates_removed.next.next.data

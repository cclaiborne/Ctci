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

  #remove kth element from a linked list
  #defined as k = 1 returning the last element
  def two_point_two(head, k)
    @current = head
    @length = 1
    while(@current.next != nil)
      @length += 1
      @current = @current.next
    end
    @current = head
    for i in 0..@length-1
      if (i == @length - k)
        return @current
      end
      @current = @current.next
    end
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
#duplicates_removed = c2.two_point_one(n1)
#n3 should be removed, thus n4 is printed
#puts duplicates_removed.next.next.data
puts c2.two_point_two(n1, 2).data

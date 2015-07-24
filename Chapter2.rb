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

  #Write code to partition a linked list around a value x, such that all
  #nodes less than x come before all nodes greater than or equal to x.
  def two_point_four(head, n)
    @current = head
    @o1 = nil
    @p1 = nil
    @current_o = nil
    @current_p = nil
    @o_flag = false
    @p_plag = false
    while(@current != nil)
      if(@current.data < n && !@o_flag)
        @o1 = Node.new(@current.data, nil)
        @current_o = @o1
        @o_flag = true
      elsif(@current.data >= n && !@p_flag)
        @p1 = Node.new(@current.data, nil)
        @current_p = @p1
        @p_flag = true
      elsif(@current.data < n && @o_flag)
        @current_o.next = Node.new(@current.data, nil)
        @current_o = @current_o.next
      elsif(@current.data >= n && @p_flag)
        @current_p.next = Node.new(@current.data, nil)
        @current_p = @current_p.next
      end
      @current = @current.next
    end
  @current_o.next = @p1
  return @o1
  end
end

n1 = Node.new(85675312, nil)
n2 = Node.new(93123, nil)
n3 = Node.new(419312, nil)
n4 = Node.new(22, nil)
n5 = Node.new(412, nil)
n6 = Node.new(216456123, nil)
n7 = Node.new(432423, nil)
n8 = Node.new(1123, nil)

n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
n5.next = n6
n6.next = n7
n7.next = n8

c2 = Chapter2.new
@partitioned_list = c2.two_point_four(n1, 10000)

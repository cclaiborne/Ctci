class Ctci
  require 'set'
  #Implement an algorithm to determine if a string has all unique characters.
  #What if you cannot use additional data structures?
  def one_point_one(word)
    @split_word = word.split(//)
    s1 = Set.new
    @split_word.each do |i|
      if (!s1.include?(i))
        s1.add(i)
      else
        return false
      end
    end
    return true
  end
end

test = Ctci.new
#return true
puts test.one_point_one("abc")
#return false
puts test.one_point_one("abcabc")


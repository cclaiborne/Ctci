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

  #Given two strings, write a method to decide if one is a permutation of the other
  def one_point_three(s1, s2)
    @split_s1 = s1.split(//)
    @split_s2 = s2.split(//)
    h1 = Hash.new
    if (s1.length != s2.length)
      return false
    end
    @split_s1.each do |letter|
      if (!h1.has_key?(letter))
        h1[letter] = 1
      else
        @value = h1.fetch(letter)
        @value = @value + 1
        h1[letter] = @value
      end
    end
    @split_s2.each do |letter|
      if (!h1.has_key?(letter))
        return false
      else
        @value = h1.fetch(letter)
        @value = @value - 1
        if(@value == -1)
          return false
        end
        h1[letter] = @value
      end
    end
    @split_s1.each do |letter|
      if (h1.fetch(letter) != 0)
        return false
      end
    end
    return true
  end

  # Implement a method to perform basic string compression using
  # the counts of repeated characters. For example, the string
  # aabcccccaaa would become a2blc5a3. If the "compressed" string would
  # not become smaller than the orig- inal string, your method should
  # return the original string.
 def one_point_five(word)
    @split_word = word.split(//)
    @final_word = ""
    @counter = 1
    if word.length == 1
      return word
    end
    for i in 0..@split_word.length-2
      if i == @split_word.length - 2
        @final_word << @split_word[i] << @counter.to_s
        if(@split_word[i] != @split_word[i+1])
          @final_word << @split_word[i+1]
        end
      elsif @split_word[i+1] != @split_word[i]
        @final_word << @split_word[i] << @counter.to_s
        @counter = 1
      else
        @counter = @counter + 1
      end
    end
    return word.length < @final_word.length ? word : @final_word
  end
end

test = Ctci.new
#return true
#puts test.one_point_one("abc")
#return false
#puts test.one_point_one("abcabc")
#return true



require 'pry'

class Triangle
  # write code here
  attr_reader :a, :b, :c
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @sides = [a, b, c]
  end

  def kind
    self.check_sides_length
    self.check_triangle_inequality
    if @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  private
  def check_sides_length
    @sides.each do |side|
      if side < 0
        raise TriangleError
      end
    end
  end

  private
  def check_triangle_inequality
    if (@sides.slice(0..1).sum <= @sides[2]) || (@sides.slice(1..2).sum <= @sides[0]) | ((@sides[0] + @sides[2]) <= @sides[1])
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end
end

#binding.pry
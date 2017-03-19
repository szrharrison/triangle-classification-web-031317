require 'pry'
class Triangle
  # write code here
  def initialize( side_a, side_b, side_c )
    @sides = []
    self.sides << side_a
    self.sides << side_b
    self.sides << side_c
  end

  attr_reader :sides
  ######################################################
  def kind
    total = self.sides.reduce(:+)
    if self.sides.any?{ |side| side <= 0 || total - side <= side}
      raise TriangleError
    elsif sides.uniq.length == 1
      type = :equilateral
    elsif sides.uniq.length == 2
      type = :isosceles
    else
      type = :scalene
    end
  end
end

class TriangleError < StandardError
  def message
    "The lengths you input cannot be configured into a triangle!"
  end
end

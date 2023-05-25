class Triangle
  class TriangleError < StandardError; end

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind
    validate_triangle

    if @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    if @sides.any? { |side| side <= 0 }
      raise TriangleError, "Triangle sides must be positive"
    end
  end

  def validate_triangle_inequality
    a, b, c = @sides.sort
    if a + b <= c
      raise TriangleError, "Triangle inequality violation"
    end
  end
end
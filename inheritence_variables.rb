class Polygon
  @@sides = 10
  @sides = 5
  
  def initialize(sides)
    @@sides = sides
  end
  
  def self.sides1
    @sides
  end
  
  def self.sides2
    @@sides
  end
  
  def sides1
    @sides
  end
  
  def sides2
    @@sides
  end
  
end

class Triangle < Polygon
  SIDES = 3
  def sides
    SIDES
  end
end

Polygon.sides1 #--> 5
Polygon.sides2 #--> 10
@polygon = Polygon.new
@polygon.sides1 #--> nil
@polygon.sides2 #--> 10
Triangle.sides #

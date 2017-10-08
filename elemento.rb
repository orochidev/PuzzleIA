class Elemento
  attr_accessor :x
  attr_accessor :y
  attr_accessor :rotulo
  #attr_accessor :puzzle
  def initialize(rot,x,y, puzzle)
    self.rotulo = rot
    self.x = x
    self.y = y
  #  self.puzzle = puzzle
  end

  def distancia_euclidiana(elemento)
    Math.sqrt( ((self.x - elemento.x)**2) + ((self.y - elemento.y)**2) )
  end

  def distancia_manhattan(elemento)
    (self.x - elemento.x).abs + (self.y - elemento.y)
  end

end

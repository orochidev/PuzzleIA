
require './elemento'

class Puzzle
  attr_accessor :elementos
  META = [1,2,3,4,5,6,7,8,0]
  def initialize(array)
    self.elementos = []
    sum = 0
    (0..2).each do |i|
      (0..2).each do |j|
        addElemento(array[sum], j,i)
        sum += 1
      end
    end

  end
  def resolvido?
    to_array == META
  end

  def num_pecas_erradas
    elementos_fora_do_lugar.size
  end
  def elementos_fora_do_lugar
    elementos = []
    to_array.each_with_index do |e, index|
      elementos << e if META[index] != e
    end
    elementos
  end
  def to_array
    array = []
    elementos.each do |e|
      array[(e.x + e.y* 3 )] = e.rotulo
    end
    array
  end
  def ==(puzzle)
    self.to_array == puzzle.to_array
  end
  def addElemento(elemento, x,y)
    self.elementos << Elemento.new(elemento, x,y, self)
  end
  def num_distancia_euclidiana
    objetivo = Puzzle.meta
    distancia = 0
    elementos.each do |u|
      distancia += u.distancia_euclidiana(objetivo.pesquisar_elemento(u.rotulo))
    end
    distancia
  end
  def num_distancia_manhattan
    objetivo = Puzzle.meta
    distancia = 0
    elementos.each do |u|
      distancia += u.distancia_manhattan(objetivo.pesquisar_elemento(u.rotulo))
    end
    distancia
  end
  def troca(elemento1, elemento2)
      retorno = Puzzle.new(self.to_array)
      if elemento1.kind_of? Fixnum
        elemento1 = retorno.pesquisar_elemento(elemento1)
        elemento2 = retorno.pesquisar_elemento(elemento2)
      end
      if elemento1 == retorno.elemento_vazio || elemento2 == retorno.elemento_vazio
      x = elemento2.x
      y = elemento2.y

      elemento2.x = elemento1.x
      elemento2.y = elemento1.y

      elemento1.x = x
      elemento1.y = y
    end
    retorno
  end
  def adjacentes(elemento)
    lista = []
    ver = elemento_in(elemento.x - 1, elemento.y)
    lista << ver if ver

    ver = elemento_in(elemento.x + 1, elemento.y)
    lista << ver if ver

    ver = elemento_in(elemento.x, elemento.y + 1)
    lista << ver if ver
    ver = elemento_in(elemento.x, elemento.y - 1)
    lista << ver if ver

    lista
  end

  def elemento_vazio
    elementos.find{|e| e.rotulo == 0}
  end

  def pesquisar_elemento(rotulo)
    elementos.find{|e| e.rotulo == rotulo}
  end

  def elemento_in(x,y)
    elementos.find{|e| e.x == x && e.y == y}
  end
  def self.meta
    Puzzle.new(META)
  end

end

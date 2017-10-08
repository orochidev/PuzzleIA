class PuzzleSolver
  attr_accessor :puzzle
  attr_accessor :nos_expandidos
  attr_accessor :nos_total
  def initialize(puzzle)
    self.puzzle = puzzle
  end
  def solve(s, heuristica = :num_pecas_erradas)
    q = []
    q << s
    visitados = []
    self.nos_expandidos = 1
    self.nos_total = 1

    while !q.empty?
      value = 0
      n = q.min_by{|puzzle| value = puzzle.num_pecas_erradas} if heuristica == :num_pecas_erradas
      n = q.min_by{|puzzle| value = puzzle.num_distancia_euclidiana} if heuristica == :distancia_euclidiana
      n = q.min_by{|puzzle| value = puzzle.num_distancia_manhattan} if heuristica == :distancia_manhattan
      n = q.min_by{|puzzle| value = puzzle.num_distancia_manhattan +  puzzle.num_distancia_euclidiana } if heuristica == :distancia_manhattan_euclidiana
      n = q.min_by{|puzzle| value = puzzle.num_pecas_erradas +  puzzle.num_distancia_manhattan } if heuristica == :num_pecas_erradas_manhattan
      n = q.min_by{|puzzle| value = puzzle.num_pecas_erradas +  puzzle.num_distancia_euclidiana } if heuristica == :num_pecas_erradas_euclidiana
      visitados << n
      self.nos_expandidos += 1
      if n.resolvido?
        return n
      else
        q.delete(n)
      end
      adj = n.adjacentes(n.elemento_vazio)
      estados_futuros = []
      adj.each do |a|
        estados_futuros << n.troca(a.rotulo,0)
      end
      self.nos_total += estados_futuros.size
      q += estados_futuros.select{|e| !visitados.include?(e) }
    end
  end

end

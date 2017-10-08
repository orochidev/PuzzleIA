require './puzzle'
require './puzzle_solver'

entrada = [2,3,1,0,5,6,4,7,8]
puzzle = Puzzle.new(entrada)
p "Utilizando heurística de Numero de Peças no Lugar errado"
p "Entrada: #{puzzle.to_array}"
solver = PuzzleSolver.new(puzzle)
result = solver.solve(puzzle, :num_pecas_erradas)
p "Saida: #{result.to_array}"
p "Nós expandidos: #{solver.nos_expandidos}"
p "Nós ao total: #{solver.nos_total}"

puzzle = Puzzle.new(entrada)
p "Utilizando heurística de Distancia euclidiana "
p "Entrada: #{puzzle.to_array}"
solver = PuzzleSolver.new(puzzle)
result = solver.solve(puzzle, :distancia_euclidiana)
p "Saida: #{result.to_array}"
p "Nós expandidos: #{solver.nos_expandidos}"
p "Nós ao total: #{solver.nos_total}"

puzzle = Puzzle.new(entrada)
p "Utilizando heurística de Distancia Manhattan "
p "Entrada: #{puzzle.to_array}"
solver = PuzzleSolver.new(puzzle)
result = solver.solve(puzzle, :distancia_manhattan)
p "Saida: #{result.to_array}"
p "Nós expandidos: #{solver.nos_expandidos}"
p "Nós ao total: #{solver.nos_total}"

puzzle = Puzzle.new(entrada)
p "Utilizando heurística de Distancia Manhattan + Distancia Euclidiana "
p "Entrada: #{puzzle.to_array}"
solver = PuzzleSolver.new(puzzle)
result = solver.solve(puzzle, :distancia_manhattan_euclidiana)
p "Saida: #{result.to_array}"
p "Nós expandidos: #{solver.nos_expandidos}"
p "Nós ao total: #{solver.nos_total}"

puzzle = Puzzle.new(entrada)
p "Utilizando heurística de Num Pecas no lugar errado + Distancia Manhattan "
p "Entrada: #{puzzle.to_array}"
solver = PuzzleSolver.new(puzzle)
result = solver.solve(puzzle, :num_pecas_erradas_manhattan)
p "Saida: #{result.to_array}"
p "Nós expandidos: #{solver.nos_expandidos}"
p "Nós ao total: #{solver.nos_total}"

puzzle = Puzzle.new(entrada)
p "Utilizando heurística de Num Pecas no lugar errado + Distancia Euclidiana "
p "Entrada: #{puzzle.to_array}"
solver = PuzzleSolver.new(puzzle)
result = solver.solve(puzzle, :num_pecas_erradas_euclidiana)
p "Saida: #{result.to_array}"
p "Nós expandidos: #{solver.nos_expandidos}"
p "Nós ao total: #{solver.nos_total}"

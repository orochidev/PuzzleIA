Exemplo de uso:

entrada = [2,3,1,0,5,6,4,7,8]

\#0 é o espaço vazio

puzzle = Puzzle.new(entrada)

solver = PuzzleSolver.new(puzzle)

result = solver.solve(puzzle, :num_pecas_erradas) #retorna o puzzle resolvido. Segundo parametro é a heuristica

\#solver mantém as informações da última busca realizada

p "Nós expandidos: \#{solver.nos_expandidos}"

p "Nós ao total: \#{solver.nos_total}"


Comando para executar o exemplo:

"ruby main.rb"


O algoritmo implementado foi a Busca A*
Atualmente implementados as heurísticas:

- Distâcia Euclidiana (:distancia_euclidiana)
- Distancia de Manhattan (:distancia_manhattan)
- Número de peças fora do lugar (:num_pecas_erradas)
- Distancia de Manhattan + Número de peças fora do lugar (:num_pecas_erradas_manhattan) (Com melhores resultados até agora)
- Distancia Euclidiana + Número de peças fora do lugar(:num_pecas_erradas_euclidiana)
- Distancia de Manhattan + Distancia Euclidiana (:distancia_manhattan_euclidiana)

Distância Euclidiana costuma ser o mais bosta de todos.

TODO:
- Distancia de chebyshev, por mera curiosidade, visto que o enunciado proposto pelo professor não exige a implementação desta heurística

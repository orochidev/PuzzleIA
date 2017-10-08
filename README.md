Exemplo de uso:

entrada = [2,3,1,0,5,6,4,7,8]
#0 � o espa�o vazio
puzzle = Puzzle.new(entrada)

solver = PuzzleSolver.new(puzzle)
result = solver.solve(puzzle, :num_pecas_erradas) #retorna o puzzle resolvido. Segundo parametro � a heuristica
#solver mant�m as informa��es da �ltima busca realizada
p "N�s expandidos: #{solver.nos_expandidos}"
p "N�s ao total: #{solver.nos_total}"


Comando para executar o exemplo:

"ruby main.rb"


O algoritmo implementado foi a Busca A*
Atualmente implementados as heur�sticas:

- Dist�cia Euclidiana (:distancia_euclidiana)
- Distancia de Manhattan (:distancia_manhattan)
- N�mero de pe�as fora do lugar (:num_pecas_erradas)
- Distancia de Manhattan + N�mero de pe�as fora do lugar (:num_pecas_erradas_manhattan) (Com melhores resultados at� agora)
- Distancia Euclidiana + N�mero de pe�as fora do lugar(:num_pecas_erradas_euclidiana)
- Distancia de Manhattan + Distancia Euclidiana (:distancia_manhattan_euclidiana)

Dist�ncia Euclidiana costuma ser o mais bosta de todos.

TODO:
- Distancia de chebyshev, por mera curiosidade, visto que o enunciado proposto pelo professor n�o exige a implementa��o desta heur�stica
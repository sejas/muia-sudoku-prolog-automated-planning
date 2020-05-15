% MUIA - FI UPM ES
% Antonio Sejas
% Mayo 2020
% SUDOKU_1
% 

numero(1).
numero(2).
numero(3).
numero(4).

no_repetidos(L) :-
    setof(X, member(X, L), Set),
    length(L, N),
    length(Set, N).

todo_numeros([]).
todo_numeros([E|T]):-numero(E), todo_numeros(T).

fila(F):- todo_numeros(F),no_repetidos(F).
filas_diferentes([]).
filas_diferentes([F1|T]):- fila(F1), filas_diferentes(T).

columnas_diferentes([[],[],[],[]]).
columnas_diferentes([[E1|T1],[E2|T2],[E3|T3],[E4|T4]]):- fila([E1,E2,E3,E4]), columnas_diferentes([T1,T2,T3,T4]).

cuadrados_diferentes([[A,B,C,D],[E,F,G,H],[I,J,K,L],[M,N,O,P]]):- filas_diferentes([[A,B,E,F], [C,D,G,H], [I,J,M,N], [K,L,O,P]]).

matriz(M):- filas_diferentes(M), columnas_diferentes(M), cuadrados_diferentes(M).



/** Ejemplo de ejecución
?- matriz([[A,B,C,D],[4,3,G,2],[I,J,K,L],[M,2,4,3]]).
*/

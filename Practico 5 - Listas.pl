/*Definir el predicado eliminar todos eliminaTodos(X, Ys, Zs). Donde X es un elemento, Ys es una lista y Zs es la lista obtenida como
resultado de la eliminación de todos los elementos X de Ys.*/

%Caso base en donde la lista está vacía
eliminaTodos(_, [], []).

%Caso recursivo en donde el primer elemento es X, devolvemos la lista restante sin X
eliminaTodos(X, [X | Ys], Zs) :- eliminaTodos(X, Ys, Zs).

%Caso recursivo en donde el primer elemento no es X, por lo que se lo conserva en la lista, y se llama recursivamente a eliminaTodos(X, Ys, Zs).
eliminaTodos(X, [Y | Ys],[Y | Zs]):- X \= Y, eliminaTodos(X, Ys, Zs).


/*Define la relación longitud(Ls, X) de forma que X sea la cantidad de elementos de la lista Ls.*/
%Caso base donde no hay elementos en la lista
longitud([], 0).

%Caso
longitud([_ | T], X):- longitud(T, X1), X is X1 + 1.

%prefijo(Xs, Ys): indica si los elementos de Xs están al principio de Ys.
prefijo(Xs,Ys) :- append(Xs,_,Ys).

%sufijo(Xs, Ys): indica si los elementos de Xs están al final de Ys.
sufijo(Xs,Ys) :- append(_,Xs,Ys).

%sublista(Xs, Ys): indica si Xs es una sublista de Ys.
sublista(Xs, Ys) :-
        	append(_, Zs, Ys),
        	append(Xs, _, Zs).

%pertenece(X, Xs): si X es un elemento de Xs.
pertenece(X, Xs) :- append(_, [X | _], Xs).

%invertirL (Xs, Ys): Ys es Xs con los elementos en orden inverso.
% CASO BASE: la lista vacía invertida es la lista vacía
invertirL([], []).
% CASO RECURSIVO: se invierte el resto de la lista y luego se concatena el primer elemento al final
invertirL([H|T], Ys) :-
     invertirL(T, Zs),
     append(Zs, [H], Ys).

%adyacentes(X, Y, Xs): si X e Y están en posiciones consecutivas en Xs.
adyacentes(X, Y, Xs) :- append(_, [X, Y | _], Xs).
adyacentes(X, Y, Xs) :- append(_, [Y, X | _], Xs).

%ultimo(Xs, X): si X es el último elemento de Xs.
ultimo(Xs, X) :- append(_, [X], Xs).

%primeros(Xs, Ys): si Ys es el resultado de eliminar el último elemento a Xs.
primeros(Xs, Ys):-append(Ys, [_], Xs).


%Define la relación menordelalista(Ls, X) de forma que X sea el menor elemento de la lista Ls numérica.
%Caso base cuando el menor de una lista con un solo elemento es el mismo elemento.
menordelalista([X], X).

%Caso recursivo, Comparamos el primer elemento con el menor de la cola.
menordelalista([H|T], X) :- menordelalista(T, Y), X is min(H, Y).

%Definir la relación elementos_pares(L1s, L2s) de forma que si L1s es una lista de números, entonces L2s es la lista de los elementos pares de L1s.
% CASO BASE: La lista vacía de entrada produce una lista vacía de salida
elementos_pares([], []).

%CASO RECURSIVO 1: Si el primer elemento es par, se incluye en la salida
elementos_pares([H|T], [H|T2]) :-
 	0 is H mod 2,
 	elementos_pares(T, T2).

%CASO RECURSIVO 2: Si el primer elemento no es par, no se incluye en la salida
elementos_pares([H|T], L2s) :-
 	1 is H mod 2,
 	elementos_pares(T, L2s).

/*Generar una lista de hombres filtrando elementos de una lista de personas (que pueden ser varones o mujeres: filtraHombres(Xs, Ys).
donde Xs es la lista de personas y, Ys es la lista de hombres en Xs.*/
% DEFINICION DE LOS HECHOS PERSONAS
persona(juan, varon).
persona(maria, mujer).
persona(pedro, varon).
persona(ana, mujer).
persona(luis, varon).
persona(laura, mujer).

% CREACIÓN DE LISTA DE PERSONAS
% persona(Nombre, Sexo)

lista_personas([
    persona(juan, varon),
    persona(maria, mujer),
    persona(pedro, varon),
    persona(ana, mujer),
    persona(luis, varon),
    persona(laura, mujer)
]).

%CASO BASE: una lista vacía da como resultado una lista vacía
filtraHombres([], []).

%CASO RECURSIVO 1: Si la cabeza de la lista es un varón, se incluye en la lista de hombres
filtraHombres([persona(Nombre, varon) | T], [persona(Nombre, varon) | Hs]) :-
     filtraHombres(T, Hs).

%CASO RECURSIVO 2: Si la cabeza de la lista es una mujer, se ignora y se procesa el resto de la lista
filtraHombres([persona(_, mujer) | T], Hs) :-
    filtraHombres(T, Hs).


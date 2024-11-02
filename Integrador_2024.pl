% Definir 'o' como un operador infijo de disyunción
:- op(500, xfy, o).

% Definir 'no' como un operador unario de negación
:- op(400, fx, no).

% Caso base: cuando un literal está negado, se traduce como 'no Literal'
pasar_a_Lista(no(Literal), [no Literal]) :- !.

% Caso base: cuando es un literal sin disyunción ni negación
pasar_a_Lista(Literal, [Literal]) :-
    Literal \= (_ o _),
    Literal \= no(_).

% Caso recursivo: descomponer la disyunción en sus partes
pasar_a_Lista(Left o Right, [LeftTranslated | Ls]) :-
pasar_a_Lista(Left, [LeftTranslated]),  % Procesar la parte izquierda
pasar_a_Lista(Right, Ls).               % Recursión con la parte derecha

% Predicado para convertir una lista de clá

lista_de_Lista([Clausula | Resto], [Traducido | Zs]) :-
    pasar_a_Lista(Clausula, Traducido),  % Convertir la cláusula actual
    lista_de_Lista(Resto, Zs).            % Recursión con el resto de la lista.

% Definición del predicado complementarios/2
complementarios(X, no(X)).
complementarios(no(X), X).

% Predicado que obtiene el resolvente de dos cláusulas
resolvente(Clause1, Clause2, Resolvente) :-
    % Encontrar literales complementarios en las dos cláusulas
    member(Literal1, Clause1),
    member(Literal2, Clause2),
    complementarios(Literal1, Literal2),
    
    % Formar el resolvente eliminando los literales complementarios
    delete(Clause1, Literal1, Rest1),
    delete(Clause2, Literal2, Rest2),
    
    % Unir los literales restantes para formar el resolvente
    append(Rest1, Rest2, Resolvente).

% Predicado para iniciar la ejecución
inicio :-
    write('Ingrese el conjunto de axiomas.....: '),
    read(Axiomas),  % Leer los axiomas como una lista de disyunciones
    write('Ingrese el dato a consultar........: '),
    read(Consulta),  % Leer el dato a consultar
    lista_de_Lista(Axiomas, ListaAxiomas),  % Convertir las cláusulas a listas de literales
    NegConsulta = no Consulta,
    pasar_a_Lista(NegConsulta, ListaConsulta),  % Pasar la consulta a una lista
    resolver_proceso(ListaAxiomas, ListaConsulta).

% Predicado para manejar el proceso de resolución paso a paso
resolver_proceso(Axiomas, Consulta) :-
    resolver_clausulas([Consulta], Axiomas), !.  % Detener al encontrar una solución

% Predicado para resolver entre las cláusulas
resolver_clausulas([], _) :-
    write('No se encontró una refutación.'), nl.
resolver_clausulas([Clause1 | _], Axiomas) :-
    member(Clause2, Axiomas),
    resolvente(Clause1, Clause2, Resolvente),
    
    % Imprimir el resolvente solo si no es la lista vacía
    ( Resolvente \= [] ->
        format('Resolvente entre: (~w) y (~w) ----> (~w)~n', [Clause1, Clause2, Resolvente])
    ;   true
    ),
    
 % Si obtenemos la cláusula vacía, detener el proceso y mostrar `box`
    ( Resolvente == [] ->
        write('Resolvente entre: '), format('~w y ~w ----> box~n', [Clause1, Clause2]), !
    ;   delete(Axiomas, Clause2, NewAxiomas),
        resolver_clausulas([Resolvente], NewAxiomas)
    )

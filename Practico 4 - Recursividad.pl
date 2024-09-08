%Escribir el predicado factorial(N, F), tal que F sea el factorial de N
factorial(0, 1).

factorial(N, F):-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.
    
/*Definir el predicado suma_hasta(N, S) que tome como entrada un número natural
mayor o igual que uno y devuelva la suma de todos los números naturales de 1 a N.
*/

%Caso base
suma_hasta(1, 1).

suma_hasta(N, S):-
    N >= 1,
    N1 is N - 1,
    suma_hasta(N1, S1),
    
%Potencia
potencia(_, 0, 1).

potencia(X, Y, Z):-
    Y > 0,
    Y1 is Y - 1,
    potencia(X, Y1, Z1),
    Z is X * Z1.
    



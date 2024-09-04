%Operaciones basicas
suma(X, A, B):- X is A + B.
resta(X, A, B):- X is A - B.
multiplicacion(X, A, B):- X is A * B.
division(X, A, B):- X is A / B.

%Areas de figuras geometricas
area_triangulo(Area, Base, Altura):- Area is 0.5 * Base * Altura.
area_cuadrado(Area, Lado):- Area is Lado * Lado.
area_rectangulo(Area, Base, Altura):- Area is Base * Altura.
area_circulo(Area, Radio):- Area is 3.14159265 * Radio * Radio.


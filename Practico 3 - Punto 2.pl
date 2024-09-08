
% Ejercicio 2 --------------- Base de datos de Empleados-----------------------


% departamento(nro_departamento, Nombre_departamento, Localidad)
%---------- -------------- -------------
 departamento(10, contabilidad, concordia).
 departamento(20, investigacion, federacion).
 departamento(30, ventas, parana).
 departamento(40, operaciones, rosario).


%empleado(idemp, emp_nombre, trabajo, jefe, sueldo, categoria, nro_departamento)
%---------- ---------- --------- ---------- -------- ---------- ---------- ----------
 empleado(7369, smith, cajero, 7902, 800, 1, 20).
 empleado(7499, allen, vendedor, 7698, 1600, 3, 30).
 empleado(7521, ward,  vendedor, 7698, 1250, 2, 30).
 empleado(7566, jones, manager, 7839, 2975, 4, 20).
 empleado(7654, martin, vendedor, 7698, 1250, 3, 30).
 empleado(7698, blake, manager, 7839,  2850, 3, 30).
 empleado(7782, clark, manager, 7839, 2450, 4, 10).
 empleado(7788, scott, analista, 7566, 3000, 4, 20).
 empleado(7839, king,  president, nulo , 5000, 5, 10).
 empleado(7844, turner, vendedor, 7698, 1500, 3, 30).
 empleado(7876, adams, cajero, 7788, 1100, 1, 20).
 empleado(7900, james, cajero, 7698, 950, 1, 30).
 empleado(7902, ford, analista, 7566, 3000, 4, 20).
 empleado(7934, miller, cajero, 7782, 1300, 2, 10).


% salario_categoria(categoria,  sal_min, sal_max).
%---------- ---------- -----------------------------
         salario_categoria(1, 700, 1200).
         salario_categoria(2, 1201, 1400).
         salario_categoria(3, 1401, 2000).
         salario_categoria(4, 2001, 3000).
         salario_categoria(5, 3001, 9999).
         
%Mostrar nombres de empleados del departamento de investigación.
emp_invest(N) :-
    departamento(Nro_departamento, 'investigacion', _),
    empleado(_, N, _, _, _, _, Nro_departamento).

%Mostrar los empleados que cobran menos de lo que indica su categoría.
paga_menos(N) :-
    empleado(_, N, _, _, Sueldo, Categoria, _),
    salario_categoria(Categoria,  Sal_min, Sal_max),
    Sueldo < Sal_min.

%Mostrar los empleados que cobran más de lo que indica su categoría.
paga_mas(N) :-
    empleado(_, N, _, _, Sueldo, Categoria, _),
    salario_categoria(Categoria,  Sal_min, Sal_max),
    Sueldo > Sal_max.

%Mostrar los empleados que cobran distinto de lo que indica su categoría.
paga_distinto(N) :-
    empleado(_, N, _, _, Sueldo, Categoria, _),
    salario_categoria(Categoria, Sal_min, Sal_max),
    (Sueldo > Sal_max; Sueldo < Sal_min).

empleado_jefe(E, J):-
    empleado(_, E, _, JefeID, _, _, _),
    empleado(JefeID, J, _, _, _, _, _).

%Dado un empleado N, mostrar sus subordinados (recursivo).
subordinadoDirectoDe(J, S):-
	empleado(_, S, _, Jefe, _, _, _),
	empleado(Jefe, J, _, _, _, _, _).

subordinadosDeN(Jefe, Subordinado) :-
    subordinadoDirectoDe(Jefe, Subordinado).
    
subordinadosDeN(Jefe, Subordinado) :-
    subordinadoDirectoDe(Jefe, Intermedio),
    subordinadosDeN(Intermedio, Subordinado).


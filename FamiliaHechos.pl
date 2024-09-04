progenitor(silvia, silvina).
progenitor(silvia, marta).
progenitor(jose, silvina).
progenitor(jose, marta).
progenitor(juan, pedro).
progenitor(juan, luis).
progenitor(maria, pedro).
progenitor(maria, luis).
progenitor(elisa, alicia).
progenitor(elisa, carlos).
progenitor(jorge, alicia).
progenitor(jorge, carlos).
progenitor(marta, paola).
progenitor(marta, mario).
progenitor(pedro, paola).
progenitor(pedro, mario).
progenitor(luis, pamela).
progenitor(luis, pablo).
progenitor(alicia, pamela).
progenitor(alicia, pablo).

mujer(silvia).
mujer(maria).
mujer(elisa).
mujer(silvina).
mujer(marta).
mujer(alicia).
mujer(paola).
mujer(pamela).

varon(jose).
varon(juan).
varon(jorge).
varon(pedro).
varon(luis).
varon(carlos).
varon(mario).
varon(pablo).

padre(X, Y):- progenitor(X, Y), varon(X).
madre(X, Y):- progenitor(X, Y), mujer(X).
abuelo(X, Y):- progenitor(X, Z), progenitor(Z, Y), varon(X).
abuela(X, Y):- progenitor(X, Z), progenitor(Z, Y), mujer(X).
hermano(X, Y):- progenitor(Z, X), progenitor(Z, Y).
primo(X, Y):- progenitor(P1, X), progenitor(P2, Y), hermano(P1, P2).
ancestro(X, Y) :- progenitor(X, Y).
ancestro(X, Y):- progenitor(X, Z), ancestro(Z, Y).

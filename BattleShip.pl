x(1).
x(2).
x(3).
x(4).
x(5).

y(1).
y(2).
y(3).
y(4).
y(5).

iscord( X, Y ):-
	x(X), y(Y),

nottried( X, Y ):-
	lastud( X, Y ).

target( X, Y):-
	iscord( X, Y ), %vaatame koordi
	nottried( X, Y ), %ei ole proovinud koordi
	asserta( lastud( X, Y ) ). %lisame et sinna oleme lastud

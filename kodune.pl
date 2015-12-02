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
:- dynamic(lastud/2).
:- dynamic(moodas/2).
:- dynamic(pihtas/2).

iscord( X, Y ):-
	x(X), y(Y).


target( X, Y ):-
	iscord(X,Y),
	nottried(X,Y),
	retractall(last_bombed(_,_)).

nottried(X,Y):-
	iscord(X,Y),
	\+ lastud(X, Y).

hit:-
	asserta( lastud( X, Y ) ),
	asserta( pihtas( X, Y ) ),
	asserta( last_hit(X, Y)).

miss:-
	nottried(X, Y),
	asserta( moodas( X, Y ) ).

sunk:-
	nottried(X,Y),
	asserta(bombed(X,Y)).

hittarget( X, Y ):-
	pihtas( K, L ).

%starget( X, Y ):-
%	iscord( X, Y ),
%	( \+ pihtas( X, Y) ) ->
%    		hittarget( X, Y );
%    		target( X, Y)).

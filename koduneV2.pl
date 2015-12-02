
:- dynamic(bombed/2).
:- dynamic(last_hit/2).
:- dynamic(agentpos/2).


coord(1,1).
coord(1,2).
coord(1,3).
coord(1,4).
coord(1,5).
coord(2,1).
coord(2,2).
coord(2,3).
coord(2,4).
coord(2,5).
coord(3,1).
coord(3,2).
coord(3,3).
coord(3,4).
coord(3,5).
coord(4,1).
coord(4,2).
coord(4,3).
coord(4,4).
coord(4,5).
coord(5,1).
coord(5,2).
coord(5,4).
coord(5,3).
coord(5,5).

target(X,Y):-
	coord(X,Y),
	nottried(X,Y),
	retractall(last_bombed(_,_)).


nottried(X,Y):-
	coord(X,Y),
	\+ bombed(X,Y).

miss:-
	nottried(X,Y),
	asserta(bombed(X,Y)).

hit:-
  	nottried(X,Y),
  	asserta(bombed(X,Y)),
  	asserta(last_hit(X,Y)).

	


sunk:-	
	nottried(X,Y),
  	asserta(bombed(X,Y)).
	

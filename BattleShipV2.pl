board([[0, 0, 0, 0, 0],
       [1, 1, 0, 0, 0],
       [0, 0, 0, 0, 0],
       [1, 1, 1, 1, 0],
       [0, 0, 0, 0, 0]]).

row_at(X, Row) :-
  board(Board),
  nth0(X, Board, Row).

column_at(Y, Row, Cell) :-
  nth0(Y, Row, Cell).

ship_at(X, Y) :-
  row_at(X, Row),
  column_at(Y, Row, Cell),
  Cell = 1.

fire_at(X, Y, State) :-
  (ship_at(X, Y) ->
    write('a hit, a very palpable hit!'), nl ;
    write('he shoots, he scores... not!'), nl).

prompt_number(Prompt, Number) :-
  write(Prompt),
  write(': '),
  read(Number).

:- initialization(main).
main :-
  repeat,
  prompt_number('enter row number', Row),
  prompt_number('enter column number', Col),
  fire_at(Row, Col, State),
  (ship_at(Row, Col) ->
    write('you won!'), nl, halt ;
    write('keep trying!'), nl, fail).

# Długość listy można w Prologu zdefiniować następująco:
#   length(0, []).
#   length(N,[_|L]) :- length(M,L), N is M+1.
# Proszę zdefiniować predykaty member/2 oraz sil/2, fib/2 i nwd/3. 
length_1(0, []).
length_1(N,[_|L]) :- length_1(M,L), N is M+1.

member_1(N, [N|_]).
member_1(N, [_|L]) :- member_1(N,L).

silnia_1(0, 1).
silnia_1(L, W) :-
    L > 0,
    NL is L-1,
    silnia_1(NL, NW),
    W is L*NW.

fibo_1(0, 0).
fibo_1(1, 1).
fibo_1(L, W) :-
    L > 1,
    NL is L-1,
    fibo_1(NL, NW),	
    W is L+NW.
#3

f(1,one).
f(s(1),two).
f(s(s(1)),three).
f(s(s(s(X))),N) :- 
    f(X,N).

#7
#a
last_1(N, [N]).
last_1(N, [_|Z]) :- last_1(N, Z).

#b delete(X,L1,L2)
delete_1(_, [], []).
delete_1(X, [X|Xs], Y) :-
    delete_1(X, Xs, Y), !.
delete_1(X, [T|Xs], [T|Y]) :-
    delete_1(X, Xs, Y).     

#c  
accRev([H|T],A,R):-  accRev(T,[H|A],R). 
accRev([],A,A).
rev(L,R):-  accRev(L,[],R).

#e
oddlength([_]).
oddlength([_,_|R]) :- oddlength(R),!.

evenlength([]).
evenlength([_,_|R]) :- evenlength(R),!.

# bez wzajemnych rekurencji
evenl([]).
evenl([X,Y|L]) :
    evenl(L);

#f
shift([],[]).
shift([X|Xs], W):-
    append(Xs, [X], W).

#g
quadrat([],[]).
quadrat([X|Xs], [R|Rs]):-
    #if
    number(X) ->
    #then
    R is X*X, quadrat(Xs, Rs);
    #else - rewrite if not a number
    R=X, quadrat(Xs,Rs). 

#without else:
quadrat([],[]).
quadrat([X|Xs], [R|Rs]):-
    number(X),
    R is X*X, quadrat(Xs, Rs).

#h
combine([],[],[]).
combine([X], [Y], [[X,Y]]).
combine([X|Xs], [R|Rs], [[X,R]|L]):-
   combine(Xs, Rs, L).




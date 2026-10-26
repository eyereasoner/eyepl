% ISO clauses: compare finite ground answer sets, without solution order.
parent(ada,bea).
parent(bea,cy).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).
append([],Tail,Tail).
append([Head|Tail],Suffix,[Head|Result]) :- append(Tail,Suffix,Result).
?- ancestor(ada,Who).
?- ancestor(cy,ada).
?- append([a,b],[c],Result).
?- append(Prefix,Suffix,[a,b]).

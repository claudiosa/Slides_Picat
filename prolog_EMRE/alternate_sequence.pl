/*
Reference:
https://www.techiedelight.com/longest-alternating-subsequence/

Running in swipl :
?- ['alternate_sequence.pl'].
true.

?- main.

 ==> [8,9,4,5,2,4]
 ==> [8,9,4,5,3,4]
 ==> [8,9,4,7,2,4]
 ==> [8,9,4,7,3,4]
 ==> [8,9,5,7,2,4]
 ==> [8,9,5,7,3,4]
 ==> [8,9,6,7,2,4]
 ==> [8,9,6,7,3,4]
true.

?- 
*/

main :- 
   findall( X, seq_m([8,9,6,4,5,7,3,2,4], X ), All_Sol_1),
   w_lst(All_Sol_1).
   
  /* %%% uncomment if you wish 
   , nl,
   write('STARTING with the HIGH values'),
   findall( Y, seq_M([8,9,6,4,5,7,3,2,4], Y ), All_Sol_2),
   w_lst(All_Sol_2).
  */ 
%%%%%%%%%%%%%%%%%%%%
seq_m([], []).
seq_m([A], [A]).
%seq_m([A,B], [A,B]):- A < B.

%
seq_m([A,B | L1], [A | L2]):- 
      A < B,
      seq_M([B | L1],  L2). %% alternate OK

seq_m([A,B | L1], L2):- 
     A > B,
     seq_m([B | L1], L2). %% advance
%% OR
seq_m([A,B | L1], L2):- 
     A > B,
     seq_m([A | L1], L2). %% advance

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
seq_M([], []).
seq_M([A], [A]).
%seq_M([A,B], [A,B]):- A > B.

%%% if OK each two ... advance
seq_M([A,B | L1], [ A | L2]):- 
     A > B,
     seq_m([B | L1],  L2). %% alternate OK

%%% if NOT  ... advance for the next
seq_M([ A , B | L1], L2):- 
     A < B,
     seq_M([ A |L1], L2). %% advance
%%OR
seq_M([ A , B | L1], L2):- 
     A < B,
     seq_M([B |L1], L2). %% advance
     

%% or use it
w_lst([]).
w_lst([X|L]) :- nl, write(' ==> '), 
                write(X), 
                w_lst(L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

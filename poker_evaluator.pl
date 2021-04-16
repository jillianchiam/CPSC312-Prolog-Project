%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Poker Hand Evaluator is a tool that helps poker players determine the hand have, as well as the cards needed to form an ideal hand.

% poker/1 takes in a list of cards and returns the best poker hand that can be formed.
% Each [Card] should be input as [Face, Suite]. Use [jack, queen, king, ace] for face cards. Suite notation does not matter, as long as you are consistent.

% Example:
%   ?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s]]).

% poker/2 takes in a list of cards, a desired hand, and determines what the next card has to be in order to form the desired hand.
% The desired hand should be one of: [royal_flush, straight_flush, four_of_a_kind, full_house, flush, straight, three_of_a_kind, two_pair, pair, high_card].

% Example:
%   ?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s]], straight).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

poker(H) :-
    face_to_num(H, Numbered_H),
    order_hand(Numbered_H, Ordered_H),
    once(determine_hand(Ordered_H, Result)),
    nl,
    to_atom(Result, Result_Atom),
    atom_concat('The best hand is a ', Result_Atom, Output_Atom),
    write(Output_Atom).


poker(H, True_Hand) :-
    face_to_num(H, Numbered_H),
    order_hand(Numbered_H, Ordered_H),
    determine_hand(Ordered_H, Result),
    True_Hand = Result,
    nl,
    write('You already have this hand.').


poker(H, False_Hand) :-
    face_to_num(H, Numbered_H),
    order_hand(Numbered_H, Ordered_H),
    determine_hand(Ordered_H, Result),
    dif(False_Hand, Result),

    append(H, [[F,S]], H2),
    face_to_num(H2, N_H2),
    order_hand(N_H2, O_H2),
    determine_hand(O_H2, False_Hand),
    
    nl,
    (print_both(F,S) ; print_face_only(F,S) ; print_suite_only(F,S)).


poker_raw(H, Hand) :-
    face_to_num(H, Numbered_H),
    order_hand(Numbered_H, Ordered_H),
    once(determine_hand(Ordered_H, Hand)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

print_both(F,S) :-
    nonvar(F),
    nonvar(S),
    to_atom(F, Face_Atom),
    to_atom(S, Suite_Atom),
    atom_concat('You are missing a ', Face_Atom, Output_Atom1),
    atom_concat(Output_Atom1, ' of ', Output_Atom2),
    atom_concat(Output_Atom2, Suite_Atom, Output_Atom3),
    write(Output_Atom3).

print_face_only(F,S) :-
    nonvar(F),
    var(S),
    to_atom(F, Face_Atom),
    atom_concat('You are missing any ', Face_Atom, Output_Atom1),
    write(Output_Atom1).

print_suite_only(F,S) :-
    var(F),
    nonvar(S),
    to_atom(S, Suite_Atom),
    atom_concat('You are missing a ', Suite_Atom, Output_Atom1),
    write(Output_Atom1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

face_to_num([],[]).
face_to_num([[F1,X]|L1],[[F2,X]|L2]):-
   convert(F1,F2),
   face_to_num(L1,L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

compareFace(X,  [F1,_], [F2,_]) :- 
    F1 == F2 ; compare(X, F1, F2).

order_hand(H1, H2) :-
    predsort(compareFace, H1, H2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

determine_hand(H, royal_flush) :- 
    sublist([[10,X],[11,X],[12,X],[13,X],[14,X]], H).

determine_hand(H, straight_flush) :-
    sublist([[A,X],[B,X],[C,X],[D,X],[E,X]], H),
    E is D+1, D is C+1, C is B+1, B is A+1.

determine_hand(H, four_of_a_kind) :-
    sublist([[A,_],[A,_],[A,_],[A,_]], H).

determine_hand(H, full_house) :-
    sublist([[A,_],[A,_],[A,_],[B,_],[B,_]], H).

determine_hand(H, flush) :-
    sublist([[_,X],[_,X],[_,X],[_,X],[_,X]], H).

determine_hand(H, straight) :-
    sublist([[A,_],[B,_],[C,_],[D,_],[E,_]], H),
    E is D+1, D is C+1, C is B+1, B is A+1.

determine_hand(H, three_of_a_kind) :-
    sublist([[A,_],[A,_],[A,_]], H).

determine_hand(H, two_pair) :-
    sublist([[A,_],[A,_],[B,_],[B,_]], H).

determine_hand(H, pair) :-
    sublist([[A,_],[A,_]], H).

determine_hand(_, high_card).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sublist([],_).
sublist([H|T1], [H|T2]) :- sublist(T1, T2).
sublist([H|T1], [_|T2]) :- sublist([H|T1], T2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

convert(2,2).
convert(3,3).
convert(4,4).
convert(5,5).
convert(6,6).
convert(7,7).
convert(8,8).
convert(9,9).
convert(10,10).
convert(jack,11).           
convert(queen,12).
convert(king,13).
convert(ace,14).

to_atom(royal_flush, 'Royal Flush.').
to_atom(straight_flush, 'Straight Flush.').
to_atom(four_of_a_kind, 'Four of a Kind.').
to_atom(full_house, 'Full House.').
to_atom(flush, 'Flush.').
to_atom(straight, 'Straight.').
to_atom(three_of_a_kind, 'Three of a Kind').
to_atom(two_pair, 'Two Pair.').
to_atom(pair, 'Pair.').
to_atom(high_card, 'High Card.').

to_atom(2, '2').
to_atom(3, '3').
to_atom(4, '4').
to_atom(5, '5').
to_atom(6, '6').
to_atom(7, '7').
to_atom(8, '8').
to_atom(9, '9').
to_atom(10, '10').
to_atom(jack, 'Jack').
to_atom(queen, 'Queen').
to_atom(king, 'King').
to_atom(ace, 'Ace').

to_atom(s, 'Spades').
to_atom(h, 'Hearts').
to_atom(d, 'Diamonds').
to_atom(c, 'Clubs').

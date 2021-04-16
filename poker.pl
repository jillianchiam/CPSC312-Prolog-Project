
start_poker(Cards) :-
    write('What cards are you holding? '),
    read_string(user, "\n", "\r", _, Response),
    (
        Response == "end"
    -> 
        fail
    ;
        Response == "that's all"
    ->
        ask_next_question(Cards)
    ; 
        start_poker(Cards0),
        Cards = [Response|Cards0]
    ).

ask_next_question(Cards) :-
    write('What cards are on the table? ' ),
    read_string(user, "\n", "\r", _, Response),
    (   Response == "None"
    ->  
        end_game   
    ;
        Response == "end"
    -> 
        fail
    ;
        Response == "Done"
    ->
        Cards = []
    ;
        checkCards(Response, Cards)
    ).

checkCards(Response, Cards) :-
    ask_next_question(Cards0),
    Cards = [Response|Cards0].


match_answer(Cards) :-
    match_list(Cards, ["10", "jack", "queen", "king", "ace"]),
    write("royal flush found \n"),
    write("The probability of royal flush is \n");

    match_list(Cards, ["h", "h", "h", "h", "h"]),
    write("straight found \n"),
    write("The probability of Straight is \n");

    match_list(Cards, ["h", "h", "c", "h", "d"]),
    write("three of a kind found \n"),
    write("The probability of Three of a kind is \n");

    match_list(Cards, []),
    write("None found \n").


match_list(List1, List2) :-
    forall(member(Element,List1), member(Element,List2)).

end_game :-
  write('Game is over').

start(Result) :-
  start_poker(List),
  match_answer(List).

   
% hand rankings
hand_rank([[10,X],[jack,X],[queen,X],[king,X],[ace,X]], 'royal_flush').

hand_rank([[A,X],[B,X],[C,X],[D,X],[E,X]], 'straight flush') :-
  successor(E,D), successor(D,C), successor(C,B), successor(B,A).

hand_rank([[A,_],[B,_],[C,_],[D,_],[E,_]], 'full house') :-
  A = B, D = E, (C = D ; C = B).

hand_rank([[_,X],[_,X],[_,X],[_,X],[_,X]], 'flush').

hand_rank([[A,_],[B,_],[C,_],[D,_],[E,_]], 'straight') :-
  successor(E,D), successor(D,C), successor(C,B), successor(B,A).

hand_rank([[C,_],[A,_],[A,_],[A,_],[B,_]], 'Four of a Kind') :-
  C = A ; B = A.
  
hand_rank([[A,_],[B,_],[C,_],[D,_],[E,_]], 'Three of a Kind') :-
  (A = B, B = C); (B = C, C = D); (C = D, D = E).
  
hand_rank([[A,_],[B,_],[C,_],[D,_],[E,_]], 'Pair') :-
  A = B; B = C; C = D; D = E.

% Unsure how to make two pair

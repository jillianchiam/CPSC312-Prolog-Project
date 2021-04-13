start_poker(Cards) :-
    write('What cards are you holding? '),
    read_string(user, "\n", "\r", _, Response),
    (
        Response == "that's all"    % once you input the two cards just type this 
        % length(Cards, 2)          % this line doesn't work (suggestions to make it take 2 inputs only?)
    ->
        ask_next_question(Cards)
    ; 
        start_poker(Cards0),
        Cards = [Response|Cards0]
    ).

ask_next_question(Cards) :-
    write('What cards are on the table? ' ),
    read_string(user, "\n", "\r", _, Response),
    (   Response == "None"                  % no cards on table
    ->  
        give_prob
    ;
        Response == "Done"                  % listed out all cards
    ->
        Cards = []
    ;
        ask_next_question(Cards0),
        Cards = [Response|Cards0]
    ).



% gives the probability based off the set of cards combined
give_prob :-
  write('The probability of *hand ranking* is 0.1');
  % calculate prob of straight flush
  write('The probability of Straight is ');
  % calculate prob of royal flush
  write('The probability of Three of a kind is ').
  
  
   
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

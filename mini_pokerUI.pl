%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To start the program, type same_cards(Cards).

% The program will then ask If I have 2 same suit cards, and 3 cards on the table?

% If you type yes, it will prompt the questions of cards in your hand and on the table.

% At the end of this file, there is an example to illustrate the query and answer.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
same_cards(Cards):-
  write("Do you have 2 same suit cards, and there's 3 cards on the table? :"),
    read_string(user, "\n", "\r", _, Response),
    (
        Response == "yes"
    -> 
        start
    ;
        Response == "no"
    ->
        try_cases
    ; 
        checkCards(Response, Cards)
    ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note: To find out 2 of a kind, type '2 same suit' when asked what cards you have in hand, press enter, followed by 'Done'

% Likewise, to find out if you have 3 same suit, type '2 same suit'when asked what cards you have in hand, press enter, 

% followed by'1 table card matches' (type all these without '' marks, eg: 

% What cards are you holding? 2 same suit   <-- correct
% What cards are you holding? '2 same suit' <-- incorrect

% Otherwise, just type the card you have. Example: if you have a Ten of Heart, type '10,h' (without quotation marks).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    
    match_list(Cards, ["10,h", "jack,h", "queen,h", "king,h", "ace,h"]),
    write("royal flush found \n");
    match_list(Cards, ["10,d", "jack,d", "queen,d", "king,d", "ace,d"]),
    write("royal flush found \n");
    match_list(Cards, ["10,s", "jack,s", "queen,s", "king,s", "ace,d"]),
    write("royal flush found \n");
    match_list(Cards, ["10,c", "jack,c", "queen,c", "king,c", "ace,c"]),
    write("royal flush found \n");

    match_list(Cards, ["ace,h", "2,h", "3,h", "4,h", "5,h"]),
    write("straight flush found \n");

    match_list(Cards, ["2,h", "3,h", "4,h", "5,h", "6,h"]),
    write("straight flush found \n");

    match_list(Cards, ["3,h", "4,h", "5,h", "6,h", "7,h"]),
    write("straight flush found \n");

    match_list(Cards, ["4,h", "5,h", "6,h", "7,h", "8,h"]),
    write("straight flush found \n");

    match_list(Cards, ["5,h", "6,h", "7,h", "8,h", "9,h"]),
    write("straight flush found \n");

    match_list(Cards, ["6,h", "7,h", "8,h", "9,h", "10,h"]),
    write("straight flush found \n");

    match_list(Cards, ["7,h", "8,h", "9,h", "10,h", "jack,h"]),
    write("straight flush found \n");

    match_list(Cards, ["8,h", "9,h", "10,h", "jack,h", "queen,h"]),
    write("straight flush found \n");

    match_list(Cards, ["9,h", "10,h", "jack,h", "queen,h", "king,h"]),
    write("straight flush found \n");
    
    match_list(Cards, ["10,h", "jack,h", "queen,h", "king,h", "ace,h"]),
    write("royal flush found \n");

    match_list(Cards, ["ace,d", "2,d", "3,d", "4,d", "5,d"]),
    write("straight flush found \n");

    match_list(Cards, ["2,d", "3,d", "4,d", "5,d", "6,d"]),
    write("straight flush found \n");

    match_list(Cards, ["3,d", "4,d", "5,d", "6,d", "7,d"]),
    write("straight flush found \n");

    match_list(Cards, ["4,d", "5,d", "6,d", "7,d", "8,d"]),
    write("straight flush found \n");

    match_list(Cards, ["5,d", "6,d", "7,d", "8,d", "9,d"]),
    write("straight flush found \n");

    match_list(Cards, ["6,d", "7,d", "8,d", "9,d", "10,d"]),
    write("straight flush found \n");

    match_list(Cards, ["7,d", "8,d", "9,d", "10,d", "jack,d"]),
    write("straight flush found \n");

    match_list(Cards, ["8,d", "9,d", "10,d", "jack,d", "queen,d"]),
    write("straight flush found \n");

    match_list(Cards, ["9,d", "10,d", "jack,d", "queen,d", "king,d"]),
    write("straight flush found \n");

    match_list(Cards, ["ace,c", "2,c", "3,c", "4,c", "5,c"]),
    write("straight flush found \n");

    match_list(Cards, ["2,c", "3,c", "4,c", "5,c", "6,c"]),
    write("straight flush found \n");

    match_list(Cards, ["3,c", "4,c", "5,c", "6,c", "7,c"]),
    write("straight flush found \n");

    match_list(Cards, ["4,c", "5,c", "6,c", "7,c", "8,c"]),
    write("straight flush found \n");

    match_list(Cards, ["5,c", "6,c", "7,c", "8,c", "9,c"]),
    write("straight flush found \n");

    match_list(Cards, ["6,c", "7,c", "8,c", "9,c", "10,c"]),
    write("straight flush found \n");

    match_list(Cards, ["7,c", "8,c", "9,c", "10,c", "jack,c"]),
    write("straight flush found \n");

    match_list(Cards, ["8,c", "9,c", "10,c", "jack,c", "queen,c"]),
    write("straight flush found \n");

    match_list(Cards, ["9,c", "10,c", "jack,c", "queen,c", "king,c"]),
    write("straight flush found \n");

    match_list(Cards, ["ace,s", "2,s", "3,s", "4,s", "5,s"]),
    write("straight flush found \n");

    match_list(Cards, ["2,s", "3,s", "4,s", "5,s", "6,s"]),
    write("straight flush found \n");

    match_list(Cards, ["3,s", "4,s", "5,s", "6,s", "7,s"]),
    write("straight flush found \n");

    match_list(Cards, ["4,s", "5,s", "6,s", "7,s", "8,s"]),
    write("straight flush found \n");

    match_list(Cards, ["5,s", "6,s", "7,s", "8,s", "9,s"]),
    write("straight flush found \n");

    match_list(Cards, ["6,s", "7,s", "8,s", "9,s", "10,s"]),
    write("straight flush found \n");

    match_list(Cards, ["7,s", "8,s", "9,s", "10,s", "jack,s"]),
    write("straight flush found \n");

    match_list(Cards, ["8,s", "9,s", "10,s", "jack,s", "queen,s"]),
    write("straight flush found \n");

    match_list(Cards, ["9,s", "10,s", "jack,s", "queen,s", "king,s"]),
    write("straight flush found \n");

    match_list(Cards, ["2 same suit"]),
    write("two of a kind found \n");
    
    match_list(Cards, ["2 same suit", "1 table card matches"]),
    write("three of a kind found \n");

    match_list(Cards, ["2 same suit", "2 table cards matches"]),
    write("four of a kind found \n");

    match_list(Cards, ["2 same suit", "3 table cards matches"]),
    write("five of a kind found \n");

    match_list(Cards, []),
    write("None found \n").


match_list(List1, List2) :-
    forall(member(Element,List1), member(Element,List2)).

end_game :-
  write('Evaluation is over.').

try_cases :-
  write("This only works for straight/royal flush and two/three/four/five of a kind.").

start :-
  start_poker(List),
  match_answer(List).
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
% How it looks

% ?- same_cards(Cards).
% Do you have 2 same suit cards, and there's 3 cards on the table? :yes
% What cards are you holding? 10,h
% What cards are you holding? jack,h
% What cards are you holding? that's all
% What cards are on the table? queen,h
% What cards are on the table? king,h
% What cards are on the table? ace,h
% What cards are on the table? Done
% royal flush found 
% true .
  
  


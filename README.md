# CPSC312-Prolog-Project

### Poker Hand Evaluator is a tool written in Prolog that helps poker players determine the hand they currently have, as well as the cards needed to form an ideal hand.

**poker/1** takes in a list of cards and returns the best poker hand that can be formed. <br />
Each ````Card```` should be input as ````[Face, Suite]````. Use ````[jack, queen, king, ace]```` for face cards. Suite notation does not matter, as long as you are consistent.

Example:

```    
?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s]]).

The best hand is a Straight.
```

**poker/2** takes in a list of cards, a desired hand, and determines what the next card has to be in order to form the desired hand. <br />
The desired hand should be one of: ````[royal_flush, straight_flush, four_of_a_kind, full_house, flush, straight, three_of_a_kind, two_pair, pair, high_card].````

Example:

```
?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s]], straight). 

You are missing any Jack.
```

If you are expanding on this project, I would suggest using **poker_raw/2** instead of the other two.

How to use Miniature UI (mini_pokerUI.pl):
The mini UI interaction will ask the player a small series of questions to check if they have a specific set of cards. In order to use it:
1) There can only be a maximum of 5 cards (two in hand and three on the table).
2) All cards must be of the same suit (all 5 cards are hearts or all 5 cards are spades etc.)
as it will only tell you if you have a straight/royal flush or 
3) "X" of a kind cards provided they already have two of the same suit in hand, with X = 2,3,4,5.
To run it, type:
```
?- same_cards(Cards).

```
Followed by answering the prompts accordingly:
```
What cards are you holding? 10,h      <-- type 10,h if you have 10 of Hearts
What cards are you holding? jack,h
What cards are you holding? that's all
What cards are on the table? queen,h
What cards are on the table? king,h
What cards are on the table? ace,h
What cards are on the table? Done

royal flush found.
```

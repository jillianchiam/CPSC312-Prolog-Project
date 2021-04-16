# CPSC312-Prolog-Project

### Poker Hand Evaluator is a tool that helps poker players determine the hand have, as well as the cards needed to form an ideal hand.

**poker/1** takes in a list of cards and returns the best poker hand that can be formed.
Each [Card] should be input as [Face, Suite]. Use [jack, queen, king, ace] for face cards. Suite notation does not matter, as long as you are consistent.

Example:
  ?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s]]).

**poker/2** takes in a list of cards, a desired hand, and determines what the next card has to be in order to form the desired hand.
The desired hand should be one of: [royal_flush, straight_flush, four_of_a_kind, full_house, flush, straight, three_of_a_kind, two_pair, pair, high_card].

Example:
  ?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s]], straight).

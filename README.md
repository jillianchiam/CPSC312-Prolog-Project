# CPSC312-Prolog-Project

How to use the poker analyzer:

Example:
Suppose you are playing Poker, and it is currently the Flop. You are holding Ace of Spades, King of Diamonds. The community cards are 10 of Spades, Ace of Diamonds, Queen of Spades.
You may ask: What is my best hand? We find out using the following query:

?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s]], Best_Hand).
Best_Hand = pair .

Hence you are holding a Pair. Next you may ask: What does the next card have to be in order for me to get a Straight?

?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s],[River_Face,River_Suite]], straight).
River_Face = jack .

Hence you need a Jack. The suite doesn't matter and is left unspecified.
Suppose the River reveals a Jack of Spades. Perfect! You should have a straight. Let's check this:

?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s],[jack,s]], Best_Hand).
Best_Hand = straight .

There is one round remaining. Is it possible for you to get a Royal Flush from this spot?

?- poker([[ace,s],[king,d],[10,s],[ace,d],[queen,s],[jack,s],[Turn_Face,Turn_Suite]], royal_flush). 
Turn_Face = king,
Turn_Suite = s .

Yes, but the last community card has to be precisely a King of Spades. Good luck!

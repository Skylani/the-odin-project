This project is made for [The Odin Project](http://theodinproject.com)'s [Project: OOP with Ruby](http://www.theodinproject.com/ruby-programming/oop)

## Project 1: Tic Tac Toe

A Tic Tac Toe game on the command line. Two human players can play against each other and the board is displayed in between turns.

### How to run
1. Download the file 'ttt.rb'.
2. In a terminal application, navigate to the folder where this file locates.
3. Run this command: `ruby ttt.rb`

### How to play
Each player takes turn to type in the corresponding grid number to place a move.

### Sample output
```
New game!

 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9

Player 1: 5

   |   |
---+---+---
   | x |
---+---+---
   |   |

Player 2: 3

   |   | o
---+---+---
   | x |
---+---+---
   |   |

Player 1: 2

   | x | o
---+---+---
   | x |
---+---+---
   |   |

Player 2: 8

   | x | o
---+---+---
   | x |
---+---+---
   | o |

Player 1: 9

   | x | o
---+---+---
   | x |
---+---+---
   | o | x

Player 2: 1

 o | x | o
---+---+---
   | x |
---+---+---
   | o | x

Player 1: 6

 o | x | o
---+---+---
   | x | x
---+---+---
   | o | x

Player 2: 4

 o | x | o
---+---+---
 o | x | x
---+---+---
   | o | x

Player 1: 7

 o | x | o
---+---+---
 o | x | x
---+---+---
 x | o | x

Result: draw
Play again? [y/n]
```

## Project 2: Mastermind

A Mastermind game on the command line. It's a game where you have to guess your opponent's secret code within a certain number of turns. Each turn you get some feedback about how good your guess was -- whether it was exactly correct or just the correct color but in the wrong space. Check out [this](https://youtu.be/OPeBUDXKGqA) video to watch an actual game play.

### How to run
1. Download the file 'mastermind.rb'.
2. In a terminal application, navigate to the folder where this file locates.
3. Run this command: `ruby mastermind.rb`

### How to play
After the prompt "[c]creator or [g]uesser?", type "g" to start guessing the code. (I didn't implement the code for being a creator)

#### Code
The code is made up of 4 colors, choosing from [b]lue, [g]reen, [o]range, [r]ed, [w]hite, [y]ellow. There may be duplicates.

When prompt to guess, type in 4 letters seperated by a space, each letter represents a color.

#### Feedback
- Colored keys: number of keys that have the correct colors and are in the correct location.
- White keys: number of keys that have the correct colors but are in the wrong location.


### Sample output
```
[c]reator or [g]uesser?
g
guess #1: w r b g
colored keys = 0  white keys = 3

guess #2: r w o b
colored keys = 2  white keys = 0

guess #3: r w g b
colored keys = 3  white keys = 0

guess #4: y w g b
colored keys = 2  white keys = 0

guess #5: r g g b
Code breaked! You win in 5 turns!
New game? [y/n]
```


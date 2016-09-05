# Hangman
A simple command line hangman game where one player plays against the computer. .

This project is made for [The Odin Project](http://theodinproject.com)'s [**Project: Serialization and Working with Files**](http://www.theodinproject.com/ruby-programming/file-i-o-and-serialization)


## What I've Learned
Save and load games using yaml file.

## How to run
1. Download the main program 'hangman.rb' and the dictionary file '5desk.txt' to the same folder.
2. In a terminal application, navigate to the folder where these file locates.
3. Run this command: `ruby hangman.rb`

## How to play
You need to guess a secret word that is between 5 and 12 characters long. You make a guess by typing in a letter (case insensitive) each turn. You have totally 5 guesses.

Type "save" at the prompt to save and exit the game.

## Sample output
```
[N]ew Game   [L]oad Game
: n
_ _ _ _ _ _ _ _ _ _ _
Letter bank:
Guesses left: 5

Guess: e
_ _ _ _ _ _ _ _ _ _ _
Letter bank: e
Guesses left: 4

Guess: a
_ a _ _ _ _ _ _ _ _ _
Letter bank: e
Guesses left: 4

Guess: i
_ a _ _ _ _ _ _ i _ _
Letter bank: e
Guesses left: 4

Guess: o
_ a _ _ _ _ _ _ i _ _
Letter bank: e, o
Guesses left: 3

Guess: u
_ a _ _ _ _ _ _ i _ _
Letter bank: e, o, u
Guesses left: 2

Guess: save
```

```
[N]ew Game   [L]oad Game
: l
[0] 2016-05-19T15:30:41-07:00.sav
[1] 2016-05-19T16:26:06-07:00.sav
[2] 2016-05-19T17:13:08-07:00.sav
[3] 2016-05-20T11:38:53-07:00.sav
[4] 2016-09-03T13:15:58-07:00.sav
: 4
_ a _ _ _ _ _ _ i _ _
Letter bank: e, o, u
Guesses left: 2

Guess: b
_ a _ _ _ _ _ _ i _ _
Letter bank: e, o, u, b
Guesses left: 1

Guess: t
_ a t _ _ _ t _ i _ _
Letter bank: e, o, u, b
Guesses left: 1

Guess: l
l a t _ _ _ t _ i _ _
Letter bank: e, o, u, b
Guesses left: 1

Guess: v
l a t _ _ _ t _ i _ _
Letter bank: e, o, u, b, v
Guesses left: 0

Game over! Answer is "latchstring"
```


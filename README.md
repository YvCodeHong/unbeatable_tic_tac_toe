# Unbeatable Tic Tac Toe

This is my first attempt at an unbeatable game of Tic Tac Toe using the Minimax Algorithm.

I have previously written a [Tic Tac Toe game](https://github.com/pelensky/ticTacToe) for two human players in JavaScript, and was originally planning on extending that game.

While researching my options for the AI (and choosing the Minimax Algorithm), I decided it would be easier to start with a new project rather than trying to adapt my previous setup to the algorithm.

I decided to write this in Ruby due to the built in ways of iterating that Ruby has that Javascript does not have.

## Instructions:
* Clone this repository
* Install all gems `bundle install`
* See tests pass by running `rspec` -> Note, the tests take a long time to run due to Minimax.
* Play the game by running `ruby play.rb`

## The brief:
*  write an unbeatable Tic-Tac-Toe (Noughts and Crosses) program
* user chooses game type (human v. computer, human v. human, or computer v. computer)
* computer player should never lose and should win whenever possible
* user should also have the choice of which player goes first

## Main resources:
* [Recursion 201: Minimax, Tic Tac Toe, & An Unbeatable AI](http://www.shei.io/recursion-minimax-algorithm/)

* [Unbeatable Tic Tac Toe with Minimax](http://malcolmnewsome.com/post/74172036027/unbeatable-tic-tac-toe-with-minimax)

* [Minimax](https://en.wikipedia.org/wiki/Minimax)

* [Minimax Algorithm Tic Tac Toe](https://www.youtube.com/watch?v=cGN6LfnOPeo)

* additional Google and Stack Overflow searches


## The Rules

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

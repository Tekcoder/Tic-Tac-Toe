# **The Tic-Tac-Toe Game.**

This a recreation of the classic Tic-Tac-Toe using Ruby. The project is meant to reinforce Object Oriented Programing (OOP) concepts. You can learn more about the game <a href="https://en.wikipedia.org/wiki/Tic-tac-toe" target="blank">**HERE.**</a>

## **How to play our game**

Our game is a command line game so you need to be in a terminal, or terminal like environment, to run it.

The game starts by taking in the names of 2 players and by default, assigns the marker, "X" to the 1st player. The board is a 3 X 3 grid and each player takes turn placing markers on the board, starting with the first player. the cycle continues until a player wins or there’s a tie game
There are 8 winning combinations: Top row, Middle row, Bottom row, Left column, Middle column, Right column, Left diagonal, and Right diagonal
There’s a draw/tie when the entire board is filled with X’s and O’s but no winning combinations can be found


<img alt="Tic-Tac-Toe" src="https://i.imgur.com/DaPhoBL.png" width="300" height="300" style="margin: 10px auto;">


## **Rules of the game**

* Players take turns playing
* 1st turn — Player 1
* Player 1 places their token (X) in only 1 square of their choice
* 2nd turn — Player 2
* A player can't play more than once during a turn.
* A player can't play in an already taken space.
* For every turn, each player will choose a numbers from 1 to 9
* Players can only choose the numbers from the board (from 1 to 9)
* Players cannot enter Alphabet or duplicate number from the board
* Once a winning sequence is reached, the game is over regardless of how many turns have passed
* Once the board is full, game is over.

## **Running the game**

In order to run the game, you'll need to have ruby installed locally. Check [HERE](https://www.ruby-lang.org/en/documentation/installation/) to learn how to install ruby. 

You will then have to Clone or download this repo. You can use `git clone https://github.com/Tekcoder/Tic-Tac-Toe.git` on the terminal if you have git installed or just download it from github.

Next, navigate the directory. The directory has the following structure:
* A bin folder that holds the `main.rb` file.
* A lib folder that holds `manager.rb` and `player.rb`
* A LICENSE.md and a README.md file.

To run the game, first verify that you have ruby installed by running `ruby -v` or `ruby --version` you should see something like `ruby 2.6.5p114 (2019-10-01 revision 67812) [x64-mingw32]`, based on your version and OS.

Next run `ruby bin/main.rb`. This command tell ruby to run our `main.rb` file. You should be greated with the game interface.

## **ENJOY!**

# Authors

<ul>
  <li>
<a href="https://github.com/Tekcoder">Roheem Olayemi</a></li>
  <li><a href="https://github.com/Audrey-Ella-xo">Odiaka Emmanuella Anita</a></li>
</ul>


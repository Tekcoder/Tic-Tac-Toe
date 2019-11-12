#!/usr/bin/env ruby
puts "Hello world!"
def show_board(
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
      puts 'show board'
    #board output
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = ["1 ", "2 ", " 3", "4 ", "5 ", "6 ", " 7", " 8", " 9"]
show_board(board)
puts "Welcome to the game! who will you be today? X or O?"
player1 = gets.chomp
player1.upcase!

if player1 == "X"
    player2 = "O"
    puts "player 1 is #{player1} and player 2 is #{player2}."

else
    player2 = "X"
    puts "player 1 is #{player1} and player 2 is #{player2}."
end

puts "In what numbered cell would you start from?"
input = gets.chomp
input.upcase!
turn = Integer(input)
board[turn-1] = player1

show_board(board)
    
puts "Now, your move is displayed on the board"

def input
    puts "If Player 1 enters 'X' then automatically 'O' is assigned to Player 2"
    puts "Display the board"
    puts "Any cell that player 1 chooses, player 2's input shouldn't override that of player 1"
    puts "The show_board method should be updated and shown on the screen"
end

def player_turn
    puts "Whenever Player 1 chooses a cell, player 2 should be alerted to play"
    puts "The following are the available moves: [1,2,3]"
    puts "To check if the game has come to an end"
end

def draw?
    puts "if all the cells are filled up without the expected winning combinations, then a message should be printed showing the draw/tie"
end

def win?
    puts "if one of the players enters the required combination, the draw method should be false and a message should be shown indicating the player who won"
end

def move(board, index, char)
    board[index] == char  
    while char < 9 
        if char < 1 && char > 9
            puts "Invalid move" 
    end
end

def position_taken?(board, index)
     !(board[index] == " " || board[index].nil?)
end

def valid_move?(board, index)
    if index.between?(0,8) && !position_taken(board, index)
        puts "This is a valid move"
        return true
    else
        return false 
    end
end

def turn_game
puts "Kindly select a cell between 1-9 apart from your first selection: "

input = gets.chomp
input.upcase!
turn = Integer(input)
board[turn-1] = player1

 if valid_move?(board, index)
    puts "Valid move"
     move(board, index, char)
     show_board(board) 
 else 
    puts "Choose a valid position! "
    turn_game(board)
 end
 show_board(board)
puts "Now, your move is displayed on the board"
end


def turn_count(board)
    board.count {|char| char == "X" || char == "O"}
end

def current_player
    if turn_count(board)%2 ==0
        current_player = "X"
      else
        current_player = "O"
    end
    return current_player
end

def full?(board)
    if board.include?(" ") || board.include?("")
      return false
  else
      return true
    end
  end

  def draw?(board)
    if !won?(board) && full?(board)
      return true
    end
  end

  def over?(board)
    puts 'is it over?'
    if won?(board) || draw?(board) || full?(board)
      return true
    else
      puts 'no keep going'
      return false
    end
  end

  
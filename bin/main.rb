#!/usr/bin/env ruby
puts "Hello world!"
def show_board(
    board = ["1 ", "2 ", " 3", "4 ", "5 ", "6 ", " 7", " 8", " 9"])
      puts 'show board'
    #board output
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = ["1 ", "2 ", " 3", "4 ", "5 ", "6 ", " 7", " 8", " 9"]
#puts show_board([1,2,3,4,5,6,7,8,9])
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
puts `clear`

show_board(board)
    
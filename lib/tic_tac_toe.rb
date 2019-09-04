require 'pry'

class TicTacToe
  attr_accessor :board
  def initialize
    @board=Array.new(9," ")
  end
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1

end

def move (index,token=X)
  @board[index]=token
end

def position_taken? (index)
  @board[index]=="X" || @board[index]== "O"

end

def valid_move? (position)
  position.between?(0,8) && @board[position]==" "
end

def turn_count
  board.count{|x| x=="X" || x=="O"}
end

def current_player
  if turn_count%2==0
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter a number 1 through 10:"
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
    display_board
  else
    turn
  end
end

def won?
  x=WIN_COMBINATIONS.find do |combo|
      board[combo[0]]=="X" &&
      board[combo[1]]=="X" &&
      board[combo[2]]=="X"
    end
  y=WIN_COMBINATIONS.find do |combo|
      board[combo[0]]=="O" &&
      board[combo[1]]=="O" &&
      board[combo[2]]=="O"
    end
    x||y
end

def full?
board.all? {|element| element=="X" || element=="O"}
end

def draw?
  full? && !won?
end

def over?
  full? || won? ||draw?
end

def winner
  if winning_combo=won?
  board[winning_combo[0]]
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif
    draw?
    puts "Cat's Game!"
  end

end

end

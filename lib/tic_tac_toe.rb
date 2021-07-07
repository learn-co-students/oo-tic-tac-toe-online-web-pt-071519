require "pry"

class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
    
  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    string.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X"|| @board[index] == "O"
      true 
    else 
      false
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) == true || index.between?(0, 8) == false
      false
    else 
      true
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |index|
      if index == "O" || index == "X"
        counter += 1 
     end
    end
    counter
  end
  
  def current_player
    if turn_count.even? 
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "choose 1-9"
    input = gets.chomp
    user_input = input_to_index(input)
    if valid_move?(user_input) 
      move(user_input,current_player)
    else 
      #puts"Invalid"
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win|
      @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
    end
  end
  
  def full?
      if turn_count == 9
        true 
      else 
        false
    end
  end
  
  def draw?
   full? && !won? 
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play 
    #input = gets.chomp
   while !over?
     turn
   end
   if draw?
     puts "Cat's Game!"
   elsif won?
   puts "Congratulations #{winner}!"
   end
  end
  
end













































require 'pry'
class TicTacToe 
  
  WIN_COMBINATIONS = [
                      [0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]]
 
 def initialize(board = nil)
   @board = Array.new(9, " ")
 end
 
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board_index, player_token = "X")
  @board[board_index] = player_token
end

def position_taken?(user_input)
  @board[user_input] != " " ? true : false
end

def valid_move?(position)
  position.between?(0, 8) && @board[position] == " "
end

def turn_count 
  @board.count {|ind| ind == "X" || ind == "O"}
end

def current_player 
  turn_count.even? ? "X" : "O"
end

def turn 
  puts "Please Enter between 1-9"
  user_input = gets.strip
  user_input = input_to_index(user_input)
  if valid_move?(user_input)
    move(user_input, current_player)
    display_board
  else 
    turn
  end
end

def  won? 
  WIN_COMBINATIONS.find do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
  end
end

def full?
  @board.none? {|index| index == " " || index = nil}
end

def draw? 
  won? == nil && full? == true
end

def over? 
  draw? == true || won? != nil
end

def winner 
  if won? != nil 
    @board[won?[0]]
  end
end 

def play 
    until over? == true
    turn
  end
    if draw? == true
      puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end

end










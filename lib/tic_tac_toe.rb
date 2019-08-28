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
  @board = board || Array.new(9, " ")
end
 
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, player_token = "X") 
    @board[index] = player_token
  end
  
  def position_taken?(input)
    @board[input] == "X" || @board[input] == "O"
  end
  
  def valid_move?(position) 
    position.between?(0, 8) && @board[position] == " " 
  end
  
  def turn_count 
    @board.count {|ind| ind != " " || nil}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn 
    puts "Enter Your Number Between 1-9"
    user = gets.strip
    input = input_to_index(user)
    if valid_move?(input)
      move(input, current_player) 
      puts display_board
    else 
      turn
    end
  end
  
  def won? 
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end
  
  def full? 
    @board.none? {|ind| ind == " " || ind == nil}
    #binding.pry
  end
  
  def draw? 
    full? && !won?
  end
  
  def over?
    draw? == true || won? != nil
  end
  
  def winner 
  if won?
    @board[won?[0]]
  else 
    nil
   end
  end
  
  def play 
    until over? 
    turn 
  end
    if won? 
      puts "Congratulations #{winner}"
    else 
      draw?
    end
  end 
end










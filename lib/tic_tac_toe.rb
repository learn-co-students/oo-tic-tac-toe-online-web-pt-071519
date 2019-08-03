require 'pry'
class TicTacToe 
  
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]
                              ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    @play
  end
  
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end
  
  def move(index, player = "X")
    @board[index] = player
    #binding.pry
  end
  
  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true : false
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
    #binding.pry
  end
  
  def turn_count
      count = 0 
      @board.each do |token|
        if token == "X" || token == "O"
          count += 1 
        end
      end
      count
    end
    
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
  
  def turn 
    puts "Please Enter Between 1-9"
    user_input = gets.strip
    user_input = input_to_index(user_input)
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else 
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[0])
      #binding.pry
    end
  end
  
  def full? 
    @board.none? do |n|
      n == " " || n == nil 
    end
  end
  
  def draw? 
    won? == nil && full? == true
  end
  
  def over? 
    draw? == true || won? != nil
  end
  
  def winner 
    if won? != nil 
      winner = @board[won?[0]]
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
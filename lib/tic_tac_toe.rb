require 'pry'

# enumerables used: .between?, .count, gets.strip, detect, all?

class TicTacToe
attr_accessor :board

#combinations in spec.rb
# defines a constant WIN_COMBINATIONS with arrays for each win combination
WIN_COMBINATIONS = [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]


  # game_1 = TicTacToe.new, #=> [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  def initialize
    # assigns an instance variable @board to an array with 9 blank spaces " "
    @board = Array.new(9, " ")
  end

  def display_board #prints arbitrary arrangements of the board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i-1
  end

  def move(board_index, symbol = "X")
    # @board is an instance variable defined in the initialize method
    # Open @board, select index, set index to symbol inputted
    @board[board_index] = symbol
  end

  def position_taken?(board_index)

    @board[board_index] != " "
    #returns true if postion is occupied
    # binding.pry
  end

  def valid_move?(board_index)
    #| !position_taken?(board_index) returns true if position is empty and index is between 0 and 8
    board_index.between?(0,8) && !position_taken?(board_index)
  end

  def turn_count
    # @inventory.count{|pet| pet.legs == 4}  #=> 2
    # counts occupied locations
    @board.count{|symbol| symbol == "X" || symbol == "O"}
    end

  def current_player
    #TODO Look at if..else shorthands
    # today == ChristmasEve ? (puts "Santa's On His Way!") : (puts "Snow")
    if turn_count % 2 == 0
      # binding.pry
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter a number between 1-9:" # Ask the user for their move by specifying a position between 1-9.
    input = gets.strip # get input
    index = input_to_index(input) # translate input into index
    symbol = current_player
    if valid_move?(index) # if index is valid
      move(index, symbol) # make the move for index
      display_board #display the board
    else
      input = gets.strip #  ask for input again
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      # binding.pry
      if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
        return combo
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
        return combo
      else
        false
      end
    end
  end

  def full?
    # if all postions on the board are occupied the board is full and returns true
    @board.all? {|position| position != " "}
  end

  def draw?
    #if now one has won and the board is full #=> draw
    !won? && full?
  end

  def over?
    # if either of these are true the game is over
    won? || full? || draw?
  end

  def winner
    WIN_COMBINATIONS.detect do |combo|
      # binding.pry
      if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
        return "X"
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
        return "O"
      else
        false
      end
    end
  end

  def play
    while !over?
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
















end
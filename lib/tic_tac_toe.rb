require 'pry'

class TicTacToe
  attr_writer :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def move(position, token = "X")
    @board[position] = token
  end

  def position_taken?(index)
   @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count {|x| x != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please pick a spot on the board between 1-9."
    position = input_to_index(gets.chomp)
      if valid_move?(position)
        token = current_player
        move(position, token)
        else
          turn
      end
        display_board
  end

  def won?
    #if the Xs or Os of @board w/ index == WIN_COMBINATIONS
    #iterate across, check index numbers of matching X or O, check against WIN_COMBINATIONS
    if WIN_COMBINATIONS.any? do |combo|
      position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
      else return false
    end
  end

    def full?
       @board.include?(" ")? false : true
     end

     def draw?
       if !won? && full?
         return true
       else
         return false
       end
     end

  def over?
    if won? == true || full? == true
      true
    else
      false
    end
  end

  def winner
  end

end

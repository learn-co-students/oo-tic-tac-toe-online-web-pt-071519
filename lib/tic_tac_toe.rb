require "pry"
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" ||  @board[index] == "O" ? true : false
  end

  def valid_move?(position)
    if position.between?(0,8) && position_taken?(position) == false
      return true
    else
      return false
    end
  end

  def turn_count
    count = @board.count("X") + @board.count("O")
    count
  end

  def current_player
    if @board.count("X") > @board.count("O")
       "O"
     elsif @board.count("X") == @board.count("O")
       "X"
     else
       "X"
     end
  end

  def turn
    puts "Please choose a position on the board from 1 to 9: "
    user_input = input_to_index(gets.chomp)
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? { |winning_combo|
      @board_combo = [@board[winning_combo[0]], @board[winning_combo[1]], @board[winning_combo[2]]]
      if  @board_combo == ["X","X","X"] || @board_combo == ["O","O","O"]
        return winning_combo
      else
        false
      end
    }
  end

  def full?
    @board.all? { |position| position == "X" || position == "O"}
  end

  def draw?
    if won? == false && full? == true
      return true
    elsif won? != false
      false
    else
      false
    end
  end

  def over?
    if full? == true || won? != false
      return true
    end
  end

  def winner
    winning_combo = won?
    if [@board_combo[0], @board_combo[1], @board_combo[2]] == ["X","X","X"]
      return "X"
    elsif [@board_combo[0], @board_combo[1], @board_combo[2]] == ["O","O","O"]
      return "O"
    end
  end

  def play
    until over? == true
      turn
      if draw? == true
        break
      end
    end

    if draw? == true
      puts "Cat's Game!"
      return "Draw"
    end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    end


end

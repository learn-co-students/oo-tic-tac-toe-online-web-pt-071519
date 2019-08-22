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
    [2,4,6]
    
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i-1
  end
  
  def move(location, new)
    @board[location] = new
  end
  
  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end
  
  def valid_move?(arg)
    arg.between?(0,8) && !position_taken?(arg)
  end
  
  def turn_count
    count_turn = 0
    @board.each do |play|
      if play == "X" || play == "O"
        count_turn += 1
      end
    end
    count_turn
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"  
    else
      "O"
    end
  end
  
  def turn
    puts "enter number from 0-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    new = current_player
    if valid_move?(index)
      move(index,new)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |routes|
      if @board[routes[0]] == "X" &&  @board[routes[1]] == "X" &&  @board[routes[2]] == "X"
       return routes
      elsif @board[routes[0]] == "O" &&  @board[routes[1]] == "O" &&  @board[routes[2]] == "O"
       return routes
      end
    end
      false
  end
  
  def full?
    @board.all? {|taken| taken != " "}
  end
  
  def draw?
    if won?
      return false
    elsif full?
      return true
    end
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    WIN_COMBINATIONS.detect do |routes|
      if @board[routes[0]] == "X" &&  @board[routes[1]] == "X" &&  @board[routes[2]] == "X"
       return "X"
      elsif @board[routes[0]] == "O" &&  @board[routes[1]] == "O" &&  @board[routes[2]] == "O"
       return "O"
      else
        nil
      end
    end
  end

  def play
    while over? == false
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
        puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end

class TicTacToe
  attr_accessor :board, :WIN_COMBINATIONS
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(string)
    input = string.to_i - 1 
  end 
  
  def move(position,player)
    @board[position] = player
  end 
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
  def turn_count
    x_count = @board.select {|x| x == "X"}
    o_count = @board.select {|o| o =="O"}
    result = x_count.length + o_count.length
    result
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end 
  
  def turn 
    puts "Please enter 1-9:"
    input = gets.chomp
    input = input_to_index(input)
    if !valid_move?(input)
      puts "invalid try again"
      turn 
    end 
    move(input,current_player)
    display_board
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      (@board[combo[0]] == "X" || @board[combo[0]] == "O")
    end 
  end
  
  def full?
    counter = 0 
    @board.each do |value|
      if value != " "
        counter += 1 
      end 
    end 
    if counter == 9 
      true 
    end 
  end 
  
  def draw?
    full? && !won? ? true : false 
  end 
  
  def over?
    full? || won? || draw? ? true : false 
  end 
  
  def winner 
    if won?
      @board[won?[0]]
    end 
  end
  
  def play
    until over? == true do 
      turn 
    end 
    if draw?
      puts "Cat's Game!"
    else 
      puts "Congratulations #{winner}!"
    end 
  end 
end 








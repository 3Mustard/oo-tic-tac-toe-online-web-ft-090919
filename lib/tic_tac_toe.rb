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
    WIN_COMBINATIONS.each do |combo|
      if  @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2] == "X"] 
        combo 
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2] == "O"]
        combo
      end 
      false 
    end 
  end 
end 

describe "#won?" do
      it 'returns false for a draw' do
        game = TicTacToe.new
        board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
        game.instance_variable_set(:@board, board)

        expect(game.won?).to be_falsey
      end

      it 'returns the winning combo for a win' do
        game = TicTacToe.new
        board = ["X", "O", "X", "O", "X", "O", "O", "X", "X"]
        game.instance_variable_set(:@board, board)

        expect(game.won?).to contain_exactly(0,4,8)
      end
    end

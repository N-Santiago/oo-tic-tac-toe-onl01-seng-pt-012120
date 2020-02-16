class TicTacToe
  attr_accessor :board 
  
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
    [2,4,6],
  ]
  
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
  
  def move(index, current_player)
      board[index] = current_player
  end
  
  def position_taken?(index)
   if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
      return false 
   else
      return true
   end
end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player
  num_turns = turn_count
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

   def turn 
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    m = valid_move?(index)
    if m == true 
      move(index, current_player)
      display_board
    else m == nil
      user_input = gets.strip
      index = input_to_index(user_input)
    end  
  end
   
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(win_combination[0])
    end 
  end
  
  def full?
   board.all? {|i| i == "X" || i == "O"}
 end 
  
  def draw?
    if full? && !won? 
      return true 
    elsif won?  
      return false
    else 
      return false 
    end
  end 
  
  def over?
    if won? || draw?
      return true
    else 
      return false
    end
  end
  
  def winner 
	index = []
  index = won?
  if index
    board[index[0]]
  end
end

def play 
  until over? == true
  turn
end

if won?
      winner == "X" || winner == "O" 
      puts "Congratulations #{winner}!" 
   elsif draw?
      puts "Cat's Game!" 
   end 
end

end 
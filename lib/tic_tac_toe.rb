WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row
  [0,3,6],  # First column
  [1,4,7],  #Second column
  [2,5,8],  #Third column
  [0,4,8],  #diagonal 1
  [2,4,6]  #diagonal 2
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, position)
  !position_taken?(board, position.to_i - 1) && (1..9).include?(index.to_i)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    puts "Please enter 1-9:"
    input = gets.strip
  end
end

def turn_count
end

def current_player
end

def won?(board)
  WIN_COMBINATIONS.each_with_index do |element, index|
    if position_taken?(board, element[0]) == true
      if board[element[0]] == board[element[1]] && board[element[1]] == board[element[2]]
        return WIN_COMBINATIONS[index]
      end
    end
  end
  return false
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  elsif !won?(board) && !full?(board)
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    board.each do |index|
      win = board[index]
    end
    win
  else
    nil
  end
end

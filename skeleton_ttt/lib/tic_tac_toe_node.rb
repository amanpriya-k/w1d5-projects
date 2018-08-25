require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board,:next_mover_mark,:prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.over? && @board.winner != next_mover_mark && !@board.nil?
    self.children.each do |child|
      return false if !child.losing_node(evaluator)
    end
    false
    #losing_node?(next_mover_mark)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    #debugger
    possible_moves = []
    (3).times do |row|
      (3).times do |col|
        possible_moves << [row, col] if @board.empty?([row, col])
      end
    end
    possible_nodes = []
    
    possible_moves.each do |pos|
      temp_board = @board.dup
      temp_board[pos] = next_mover_mark
      if @next_mover_mark == :o 
        prev_mover_mark = :x 
      else 
        prev_mover_mark = :o 
      end
      poss = TicTacToeNode.new(temp_board,prev_mover_mark,pos)
      possible_nodes << poss
    end
    possible_nodes
  end
  
end

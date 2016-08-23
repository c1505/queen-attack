# do i want a board object?
require 'pry'
class Queens
  attr_reader :white, :black
  def initialize(args={})
    @white = args[:white] || [0, 3]
    @black = args[:black] || [7, 3]
    raise ArgumentError, 'Queens cannot occupy the same space' if @white == @black
  end
  
  def to_s
    board = <<-BOARD.chomp
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
    BOARD
    a = board.lines
    vertical = @white[0]
    horizontal = @white[1] * 2
    a[vertical][horizontal] = 'W'
    
    vertical = @black[0]
    horizontal = @black[1] * 2
    a[vertical][horizontal] = 'B'
    
    a.join
  end
  
  def attack?
    if @black[0] == @white[0] || @black[1] == @white[1]
      true
    elsif positive_diagonal? || other_diagonal?
      true
    else
      false
    end
  end
  
  def positive_diagonal?
    diagonal_array = []
    wh = @white
    while wh[0] < 7 && wh[1] < 7
      wh = wh.map {|f| f + 1 }
      diagonal_array << wh
    end
    diagonal_array.include?(@black)
  end
  
  def other_diagonal?
    diagonal_array = []
    wh = @white
    while wh[0] < 7 && wh[1] < 7
      wh = [wh[0] - 1, wh[1] + 1]
      diagonal_array << wh
    end
    diagonal_array.include?(@black)
  end

end
# 

class Board
end
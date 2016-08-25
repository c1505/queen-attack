
require 'pry'
# test is looking for a position when calling Queens.black so it isn't really practical to make each Queen objects
class Queen 
  attr_reader :position, :color
  def initialize(color, position)
    @color = color
    @position = position
  end
  
end
    
class Queens
  # attr_reader :white, :black
  attr_writer :board
  def initialize(args={})
    
    if args[:white]
      @white = Queen.new('W', args[:white])
    else
      args[:white] = [0, 3]
      @white = Queen.new('W', args[:white])
    end
    
    if args[:black]
      @black = Queen.new('B', args[:black])
    else
      args[:black] = [7, 3]
      @black = Queen.new('B', args[:black])
    end
    # @white = args[:white] || [0, 3]
    # @black = args[:black] || [7, 3]
    raise ArgumentError, 'Queens cannot occupy the same space' if @white.position == @black.position
  end
  
  def white
    @white.position
  end
  
  def black
    @black.position
  end
  
  def board
    @board ||= <<-BOARD.chomp
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
    BOARD
  end
  
  def to_s
    board_rows = board.lines
    
    add_to_board(@white, board_rows)
    add_to_board(@black, board_rows)
    # vertical = @white[0]
    # horizontal = @white[1] * 2
    # board_rows[vertical][horizontal] = 'W'
    
    # vertical = @black[0]
    # horizontal = @black[1] * 2
    # board_rows[vertical][horizontal] = 'B'
    
    board_rows.join
  end
  
  def add_to_board(queen, board_rows)
    # board_rows = board.lines
    vertical = queen.position[0]
    horizontal = queen.position[1] * 2
    board_rows[vertical][horizontal] = queen.color
  end
  
  def attack?
    if @black.position[0] == @white.position[0] || @black.position[1] == @white.position[1]
      true
    elsif positive_diagonal? || other_diagonal?
      true
    else
      false
    end
  end
  
  def positive_diagonal?
    diagonal_array = []
    wh = @white.position
    while wh[0] < 7 && wh[1] < 7
      wh = wh.map {|f| f + 1 }
      diagonal_array << wh
    end
    diagonal_array.include?(@black.position)
  end
  
  def other_diagonal?
    diagonal_array = []
    wh = @white.position
    while wh[0] < 7 && wh[1] < 7
      wh = [wh[0] - 1, wh[1] + 1]
      diagonal_array << wh
    end
    diagonal_array.include?(@black.position)
  end

end
# 

# class Board
# end
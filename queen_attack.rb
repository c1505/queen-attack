
require 'pry'
# test is looking for a position when calling Queens.black so it isn't really practical to make each Queen objects
class Queen 

  def initialize(args={})
    # @white = args[:white] || [0, 3]
    # @black = args[:black] || [7, 3]
    @color = color(args)
    # if args[:white]
    #   @position = 
    # @position = position
  end
  
  def color(args)
    if args[:white]
      'W'
    elsif args[:black]
      'B'
    end
  end
end
    
class Queens
  # attr_reader :white, :black
  attr_writer :board
  def initialize(args={})
    
    if args[:white]
      @white = Queen.new(args)
    else
      args[:white] = [0, 3]
      @white = Queen.new(args)
    end
    
    if args[:black]
      @black = Queen.new(args)
    else
      args[:black] = [7, 3]
      @black = Queen.new(args)
    end
    # @white = args[:white] || [0, 3]
    # @black = args[:black] || [7, 3]
    raise ArgumentError, 'Queens cannot occupy the same space' if @white == @black
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
    
    add_to_board(@white, 'W', board_rows)
    add_to_board(@black, 'B', board_rows)
    # vertical = @white[0]
    # horizontal = @white[1] * 2
    # board_rows[vertical][horizontal] = 'W'
    
    # vertical = @black[0]
    # horizontal = @black[1] * 2
    # board_rows[vertical][horizontal] = 'B'
    
    board_rows.join
  end
  
  def add_to_board(color, character, board_rows)
    # board_rows = board.lines
    vertical = color[0]
    horizontal = color[1] * 2
    board_rows[vertical][horizontal] = character
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

# class Board
# end
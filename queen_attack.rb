
class Queen 
  attr_reader :position, :color
  def initialize(color, position)
    @color = color
    @position = position
  end
  
end
    
class Queens
  attr_writer :board
  def initialize(args={})
    args[:white] = args[:white] || [0, 3]
    args[:black] = args[:black] || [7, 3]
    @white = Queen.new('W', args[:white])
    @black = Queen.new('B', args[:black])

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
    
    board_rows.join
  end
  
  def add_to_board(queen, board_rows)
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
    diagonal = []
    diagonal_point = @white.position
    while diagonal_point[0] < 7 && diagonal_point[1] < 7
      diagonal_point = diagonal_point.map {|f| f + 1 }
      diagonal << diagonal_point
    end
    diagonal.include?(@black.position)
  end
  
  def other_diagonal?
    diagonal = []
    diagonal_point = @white.position
    while diagonal_point[0] < 7 && diagonal_point[1] < 7
      diagonal_point = [diagonal_point[0] - 1, diagonal_point[1] + 1]
      diagonal << diagonal_point
    end
    diagonal.include?(@black.position)
  end

end

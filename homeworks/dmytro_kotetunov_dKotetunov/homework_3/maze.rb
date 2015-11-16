class Maze

  DIRECTIONS = [ [1, 0], [-1, 0], [0, 1], [0, -1] ]

  def initialize start_x, start_y, width, height
    @width = width
    @height = height
    @start_x = start_x
    @start_y = start_y
    @vertical_walls   = Array.new(width) { Array.new(height, true) }
    @horizontal_walls = Array.new(width) { Array.new(height, true) }
    @end_x   = rand(width)
    @end_y   = height - 1
    @path             = Array.new(width) { Array.new(height) }
    @horizontal_walls[@end_x][@end_y] = false
    generate
  end

  def solve

    # Clean up.
    reset_visiting_state

    @queue = []
    enqueue_cell([], @start_x, @start_y)

    path = nil
    until path || @queue.empty?
      path = solve_visit_cell
    end

    if path
      for x, y in path
        @path[x][y] = true
      end
    else
      puts "No solution found?!"
    end

    @path
  end

  private

  def generate
    reset_visiting_state
    generate_visit_cell(@start_x, @start_y)
  end

  def generate_visit_cell(x, y)
    @visited[x][y] = true

    #coordinates = DIRECTIONS.shuffle.map { |dx, dy| [x + dx, y + dy] }

    #for new_x, new_y in coordinates
     # next unless move_valid?(new_x, new_y)
      #connect_cells(x, y, new_x, new_y)
      #generate_visit_cell(new_x, new_y)
    #end

    @horizontal_walls = [[false, false, false, false, false, false, true],
                         [true, false, true, true, false, true, true],
                         [true, true, true, false, true, true, true],
                         [false, true, false, true, false, true, true],
                         [false, true, false, false, false, false, true],
                         [false, false, true, false, true, true, false],
                         [false, false, true, true, false, false, false]]

    @vertical_walls = [[false, true, true, false, true, true, false],
                       [false, false, false, false, true, false, false],
                       [true, false, false, true, false, false, false],
                       [false, true, true, false, true, true, false],
                       [false, false, true, true, true, false, true],
                       [false, true, false, false, false, false, true],
                       [true, true, true, true, true, true, true]]
  end

  def reset_visiting_state
    @visited = Array.new(@width) { Array.new(@height) }
  end

  def enqueue_cell(path, x, y)
    @queue << path + [[x, y]]
  end

  def move_valid?(x, y)
    (0...@width).cover?(x) && (0...@height).cover?(y) && !@visited[x][y]
  end

  def connect_cells(x1, y1, x2, y2)
    if x1 == x2
      @horizontal_walls[x1][ [y1, y2].min ] = false
    else
      @vertical_walls[ [x1, x2].min ][y1] = false
    end
  end

  def solve_visit_cell
    path = @queue.shift
    x, y = path.last

    return path  if x == @end_x && y == @end_y

    @visited[x][y] = true

    for dx, dy in DIRECTIONS
      if dx.nonzero?
        new_x = x + dx
        if move_valid?(new_x, y) && !@vertical_walls[ [x, new_x].min ][y]
          enqueue_cell(path, new_x, y)

        end
      else
        new_y = y + dy
        if move_valid?(x, new_y) && !@horizontal_walls[x][ [y, new_y].min ]
          enqueue_cell(path, x, new_y)
        end
      end
    end

    nil
  end
end

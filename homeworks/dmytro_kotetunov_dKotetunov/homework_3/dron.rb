require './maze_sides'
require './maze'

class Dron

  def initialize(width, height)
    @width   = width
    @height  = height
    @start_x = rand(width)
    @start_y = 0

    @path = Maze.new(@start_x, @start_y, width, height).solve()
  end


  def print
    str_end = ''
    array = MazeSides.new().build_sides(@width, @height, @path)
    puts ; puts; puts;
    @height.times do |x|
      @width.times do |y|
        if array[x][y] != 0
          if array[x+1] && array[x+1][y] != 0
            str_end << 'E '
          elsif array[x-1] && array[x-1][y] != 0
            str_end << 'W '
          elsif array[x][y+1] && array[x][y+1] != 0
            str_end << 'S '
          elsif array[x][y-1] && array[x][y-1] != 0
            str_end << 'N '
          end
        end
      end
    end
    str_end = str_end.split(' ')
    str_end.each_with_index{ |r, i| str_end[i] = nil if str_end[i] == str_end[i+1]  }
    str_end.compact!
    p array
    p str_end

  end
end

dron = Dron.new 7,7
dron.print


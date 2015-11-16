class MazeSides
  NUMBER_OF_SIDES = {
      'empty' => 0,
      'top' => 1,
      'right' => 2,
      'bottom' => 3,
      'left' => 4,
      'righttop' => 5,
      'rightbottom' => 6,
      'leftbottom' => 7,
      'lefttop' => 8,
      'leftright' => 9,
      'topbottom' => 10,
      'leftrightbottom' => 11,
      'lefttopbottom' => 12,
      'leftrighttop' => 13,
      'righttopbottom' => 14,
      'leftrighttopbottom' => 15
  }

  def build_sides(width, height, path)
    array = Array.new(width)
    width.times{ |i| array[i] = Array.new(height) }
    height.times do |x|
      width.times do |y|
        if path[x][y]
          str = ''
          str << 'left' unless path[x-1] && path[x-1][y]
          str << 'right' unless path[x+1] && path[x+1][y]
          str << 'top' unless path[y-1] && path[x][y-1]
          str << 'bottom' unless path[y+1] && path[x][y+1]
          str = 'empty' if str.empty?
        end
        NUMBER_OF_SIDES[str] ? array[x][y] = NUMBER_OF_SIDES[str] : array[x][y] = 0
      end
    end

    array
  end
end

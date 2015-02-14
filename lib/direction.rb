class Direction < Struct.new(:value)

  def self.for(dir)
    dir.instance_of?(Direction) ? dir : new(dir)
  end

  def offset
    {
     'NORTH' => [0,1],
     'EAST' =>  [1,0],
     'SOUTH' =>  [0,-1],
     'WEST' =>  [-1,0]
    }[value]
  end

  def to_s
    value
  end

  def left
    directions[directions.find_index(value) - 1]
  end

  def right
    directions[(directions.find_index(value) + 1) % directions.length]
  end

  private

  def directions
    %w(NORTH EAST SOUTH WEST)
  end

end

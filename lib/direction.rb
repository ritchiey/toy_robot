class Direction < Struct.new(:value)

  def self.for(str)
    new(str)
  end

  def offset
    case value
    when 'NORTH' then [0,1]
    when 'EAST' then  [1,0]
    when 'SOUTH' then  [0,-1]
    when 'WEST' then  [-1,0]
    end
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

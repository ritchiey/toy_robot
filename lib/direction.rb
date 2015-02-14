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
    'NORTH'
  end

end

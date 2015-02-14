# the Robot class is immutable (ie, it never changes state).
# Instead it returns new instances of Robot with
# updated state.
#

class Direction < Struct.new(:value)

  def self.for(val)
    new(val)
  end

  def to_s
    value
  end

end

class Robot

  attr_reader :table, :x, :y, :direction

  def initialize(table, options={})
    @table = table
    @output = options[:output]
    @x = options[:x]
    @y = options[:y]
    @direction = Direction.for(options[:f])
  end

  def follow(command)
    parts = command.split(' ')
    parts[0] = parts[0].downcase.to_sym
    if self.respond_to? parts[0]
      self.send(*parts)
    else
      self
    end
  end

  def report
    "#{x},#{y},#{direction}"
  end

end

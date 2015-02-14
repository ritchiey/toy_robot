# the Robot class is immutable (ie, it never changes state).
# Instead it returns new instances of Robot with
# updated state.
#

class Robot

  attr_reader :table, :x, :y, :direction

  def initialize(table, options={})
    @table = table
    @output = options[:output]
    @x = options[:x]
    @y = options[:y]
    @direction = options[:f]
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
    if placed?
      "#{x},#{y},#{direction}"
    else
      self
    end
  end

  private

  def placed?
    !!x
  end

end

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
    method, params = command.split(' ')
    method = method.downcase.to_sym
    if self.respond_to? method
      self.send(method, *interpret(params || ""))
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

  def place(x, y, facing)
    robot = Robot.new table, x: x, y: y, f: facing
    robot.on_table? ? robot : self
  end

  def placed?
    !!x
  end

  def on_table?
    x >= 0 && y >= 0 && y < table.height && x < table.width
  end

  private

  def interpret(params)
    params.split(',').map{|p|is_int?(p) ? p.to_i : p }
  end

  def is_int?(str)
    str =~ /^[0-9]$/
  end

end

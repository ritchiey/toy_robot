# the Robot class is immutable (ie, it never changes state).
# Instead it returns new instances of Robot with
# updated state.
class Robot

  attr_reader :output

  def initialize(table, options={})
    @output = options[:output]
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

end

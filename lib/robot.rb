# the Robot class is immutable (ie, it never changes state).
# Instead it returns new instances of Robot with
# updated state.
class Robot

  attr_reader :output

  def initialize(table, options={})
    @output = options[:output]
  end

end

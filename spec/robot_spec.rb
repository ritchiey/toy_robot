require_relative '../lib/table'
require_relative '../lib/robot'


describe Robot do

  let(:table) {Table.new 5, 5}
  subject {Robot.new(table)}

  describe "#follow" do

    it "parses the command and returns the value of the matching method on the robot" do
      expect(subject).to receive(:some_command).and_return(:some_result)
      expect(subject.follow('SOME_COMMAND')).to eq(:some_result)
    end

    it "passes the parameters to the command as parameters to the method call" do
      expect(subject).to receive(:some_command).with('hi', 'there').and_return(:some_result)
      expect(subject.follow('SOME_COMMAND hi there')).to eq(:some_result)
    end

    it "returns itself (unchanged) if it doesn't understand the command" do
      expect(subject.follow "SOME_UNKNOWN_COMMAND").to eq(subject)
    end

    it "doesn't call itself" do
      expect(subject).to receive(:follow).once
      subject.follow "FOLLOW"
    end

  end


  describe "#place" do

    it "can be placed on the table facing North"
    it "can be placed on the table facing East"
    it "can be placed on the table facing West"
    it "can be placed on the table facing South"

    it "ignores requests to place it too far North"
    it "ignores requests to place it too far East"
    it "ignores requests to place it too far West"
    it "ignores requests to place it too far South"

  end

  #. The origin (0,0) can be considered to be the SOUTH WEST most corner.
  #. The first valid command to the robot is a PLACE command, after that, any
  #sequence of commands may be issued, in any order, including another PLACE
  #command. The application should discard all commands in the sequence until a
  #valid PLACE command has been executed.

  #. MOVE will move the toy robot one unit forward in the direction it is currently
  #facing.

  describe "#move" do

    it "ignores the request if it isn't on the table"
    context "when facing North" do
      it "moves one unit North"
      it "won't fall off the North edge of the table"
    end

    context "when facing East" do
      it "moves one unit East"
      it "won't fall off the East edge of the table"
    end

    context "when facing South" do
      it "moves one unit South"
      it "won't fall off the South edge of the table"
    end

    context "when facing West" do
      it "moves one unit West"
      it "won't fall off the West edge of the table"
    end

    end

  #. LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  #without changing the position of the robot.

  describe "#right" do

    it "can turn to the North"
    it "can turn to the East"
    it "can turn to the West"
    it "can turn to the South"

  end

  describe "#left" do

    it "can turn to the North"
    it "can turn to the East"
    it "can turn to the West"
    it "can turn to the South"

  end

  #. REPORT will announce the X,Y and F of the robot. This can be in any form, but
  #standard output is sufficient.
  describe "report" do
    it "ignores the command if it isn't on the table"
    it "reports its location and direction"
  end

  describe "output" do
    it "returns the value given when the robot was created" do
      robot = Robot.new(table, output: "blah")
      expect(robot.output).to eq("blah")
    end
  end

end

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
      expect(subject).to receive(:place).with(1, 2, 'EAST').and_return(:some_result)
      expect(subject.follow('PLACE 1,2,EAST')).to eq(:some_result)
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

    it "can be placed on the table facing North" do
      robot = subject.place(1, 2, 'NORTH')
      expect(robot).to be_placed
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.direction).to eq('NORTH')
    end

    it "ignores requests to place it off the table" do
      robot = subject.place(1, table.height, 'NORTH')
      expect(robot).to_not be_placed
    end

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
    context "when on the table" do
      subject { Robot.new(table, x:0, y:0, f: 'NORTH')}
      it "reports its location and direction" do
        expect(subject.report).to eq("0,0,NORTH")
      end
    end

    it "ignores the command if it isn't on the table" do
      expect(subject.report).to eq(subject)
    end
  end

  describe "#on_table?" do
    it "can't be too far North" do
      expect(described_class.new(table, x:0, y: table.height-1)).to be_on_table
      expect(described_class.new(table, x:0, y: table.height)).to_not be_on_table
    end

    it "can't be too far East" do
      expect(described_class.new(table, x:table.width-1, y: 0)).to be_on_table
      expect(described_class.new(table, x:table.width, y: 0)).to_not be_on_table
    end
    it "can't be too far South" do
      expect(described_class.new(table, x:0, y: 0)).to be_on_table
      expect(described_class.new(table, x:0, y: -1)).to_not be_on_table
    end

    it "can't be too far West" do
      expect(described_class.new(table, x:0, y: 0)).to be_on_table
      expect(described_class.new(table, x:-1, y: 0)).to_not be_on_table
    end

  end

end

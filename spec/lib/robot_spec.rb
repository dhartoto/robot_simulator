require 'spec_helper'
require 'robot'

describe Robot do
  describe '.new' do
    let(:robot) { Robot.new }
    it 'creates an instance of Robot' do
      expect(robot).to be_an_instance_of(Robot)
    end
    it { should respond_to(:x_axis) }
    it { should respond_to(:y_axis) }
    it { should respond_to(:bearing) }
    it { should respond_to(:message) }
  end

  describe '#receive' do
    it 'receives receive message' do
      robot = Robot.new
      expect(robot).to receive(:receive).with('MOVE')
      robot.receive('MOVE')
    end
  end
end

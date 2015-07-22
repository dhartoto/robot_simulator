require 'spec_helper'
require 'robot'

describe Robot do
  describe '.new' do
    it 'creates an instance of Robot' do
      robot = Robot.new
      expect(robot).to be_an_instance_of(Robot)
    end
  end
end

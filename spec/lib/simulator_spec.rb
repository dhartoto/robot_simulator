require 'spec_helper'
require 'ostruct'
require 'simulator'
require 'Robot'
require 'Command'

describe Simulator do
  describe '.new' do
    let(:robot) { instance_double('Robot') }

    it 'creates an instance of Simulator' do
      simulator = Simulator.new(robot)
      expect(simulator).to be_an_instance_of(Simulator)
    end
    it 'assigns and instance of Robot to simulator' do
      robot = Robot.new
      simulator = Simulator.new(robot)
      expect(simulator.robot).to be_an_instance_of(Robot)
    end
    it 'assigns instructions for issuing command to display' do
      msg = "Issue the command 'PLACE' along with the board co-ordinates and"\
        " bearing to position the robot on the board. e.g. 'PLACE 0,1,NORTH'\n"\
        "You can also instruct the robot to carry out an action with the following"\
        " commands: 'MOVE', 'LEFT', 'RIGHT, 'REPORT'\n"\
        "Issue the command 'EXIT' to quit the simulator."
      simulator = Simulator.new(robot)
      expect(simulator.display).to eq(msg)
    end
  end

  describe '#run' do
    let(:robot)     { instance_double('Robot') }
    let(:simulator) { Simulator.new(robot) }


    it 'requests user input' do
      command = OpenStruct.new(valid?: true)
      message = OpenStruct.new(message: 'ok')
      allow(Command).to receive(:build).and_return(command, 'EXIT')
      allow(robot).to receive(:receive).and_return(message)
      expect(simulator).to receive(:gets){ 'MOVE'}
      expect(simulator).to receive(:gets){ 'EXIT'}
      simulator.run
    end

    context 'when user issue valid command' do
      let(:message) { OpenStruct.new(message: 'ok') }
      let(:command)   { OpenStruct.new(valid?: true) }

      before do
        allow(Command).to receive(:build).and_return(command, 'EXIT')
        allow(robot).to receive(:receive).and_return(message)
        allow(simulator).to receive(:gets) { 'MOVE' }
      end

      it 'sends #receive to robot' do
        expect(robot).to receive(:receive)
        simulator.run
      end
      it 'displays response from robot' do
        simulator.run
        expect(simulator.display).to eq('ok')
      end
    end
    context 'when user issue invalid command' do
      let(:command) { OpenStruct.new(valid?: false, error_message: 'error') }
      before do
        allow(simulator).to receive(:gets) { 'MOVE' }
        allow(Command).to receive(:build).and_return(command, 'EXIT')
      end

      it 'does not send #receive to robot' do
        expect(robot).not_to receive(:receive)
        simulator.run
      end
      it 'displays error message' do
        simulator.run
        expect(simulator.display).to eq('error')
      end
    end
    context 'when user issue EXIT command' do
      before do
        allow(Command).to receive(:build).and_return('EXIT')
        allow(simulator).to receive(:gets) { 'EXIT' }
      end

      it 'exits the application' do
        expect(simulator).to receive(:gets).once
        simulator.run
      end
      it 'does not send #receive to robot' do
        expect(robot).not_to receive(:receive)
        simulator.run
      end
    end
  end
end

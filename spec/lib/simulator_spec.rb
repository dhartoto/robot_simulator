require 'spec_helper'
require 'simulator'
require 'Robot'

describe Simulator do
  describe '.new' do
    it 'creates an instance of Simulator' do
      robot = instance_double('robot')
      simulator = Simulator.new(robot)
      expect(simulator).to be_an_instance_of(Simulator)
    end
    it 'assigns and instance of Robot to simulator' do
      robot = Robot.new
      simulator = Simulator.new(robot)
      expect(simulator.robot).to be_an_instance_of(Robot)
    end
  end

  describe '#run' do
    let(:robot)     { instance_double('Robot') }
    let(:simulator) { Simulator.new(robot) }

    it 'instruct user to enter a command.' do
      allow(simulator).to receive(:gets) { 'MOVE' }
      simulator.run
      msg = "Welcome to Robot Simulator!"
      expect(simulator.display).to eq(msg)
    end
    it 'requests user input' do
      expect(simulator).to receive(:gets) { 'MOVE' }
      simulator.run
    end

    context 'when user issue valid command' do
      before { allow(simulator).to receive(:gets) { 'MOVE' } }

      it 'sends #receive to robot' do
        expect(robot).to receive(:receive).with('MOVE')
        simulator.run
      end
      it 'displays response from robot'
    end
    context 'when user issue invalid command' do
      it 'does not send #receive to robot'
      it 'displays error message'
    end
    context 'when user input EXIT' do
      it 'does not send #receive to robot'
      it 'displays exit message'
      it 'exits the application'
    end
  end
end

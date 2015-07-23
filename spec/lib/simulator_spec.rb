require 'spec_helper'
require 'ostruct'
require 'simulator'
require 'Robot'

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
    it 'assigns welcome message to display' do
      msg = "Welcome to Robot Simulator!"
      simulator = Simulator.new(robot)
      expect(simulator.display).to eq(msg)
    end
  end

  describe '#run' do
    let(:robot)     { instance_double('Robot') }
    let(:simulator) { Simulator.new(robot) }

    it 'requests user input' do
      message = OpenStruct.new(message: 'ok')
      allow(robot).to receive(:receive).and_return(message)
      expect(simulator).to receive(:gets) { 'MOVE' }
      simulator.run
    end

    context 'when user issue valid command' do
      let(:message) { OpenStruct.new(message: 'ok') }

      before do
        allow(robot).to receive(:receive).and_return(message)
        allow(simulator).to receive(:gets) { 'MOVE' }
      end

      it 'sends #receive to robot' do
        expect(robot).to receive(:receive).with('MOVE')
        simulator.run
      end
      it 'displays response from robot' do
        simulator.run
        expect(simulator.display).to eq('ok')
      end
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

require 'spec_helper'
require 'simulator'

describe Simulator do
  describe '.new' do
    it 'creates an instance of Simulator' do
      simulator = Simulator.new
      expect(simulator).to be_an_instance_of(Simulator)
    end
  end

  describe '#run' do
    it 'instruct user to enter a command.' do
      simulator = Simulator.new
      simulator.run
      msg = "Welcome to Robot Simulator!"
      expect(simulator.display).to eq(msg)
    end
    it 'requests user input'

    context 'when user input valid command' do
      it 'sends #receive to robot'
      it 'displays response from robot'
    end
    context 'when user input invalid command' do
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

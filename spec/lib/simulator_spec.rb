require 'spec_helper'
require 'simulator'

describe Simulator do
  describe '.new' do
    it 'creates an instance of Simulator' do
      simulator = Simulator.new
      expect(simulator).to be_an_instance_of(Simulator)
    end
  end
end

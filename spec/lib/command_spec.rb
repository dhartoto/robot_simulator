require 'spec_helper'
require 'command'

describe Command do
  it 'is a module' do
    command = Command.for
    expect(Command).to be_an_instance_of(Module)
  end
end

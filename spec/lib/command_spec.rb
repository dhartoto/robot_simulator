require 'spec_helper'
require 'command'

describe Command do
  it 'is a module' do
    expect(Command).to be_an_instance_of(Module)
  end
end

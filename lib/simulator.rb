class Simulator
  attr_reader   :robot
  attr_accessor :display

  def initialize(robot)
    @display = "Welcome to Robot Simulator!"
    @robot   = robot
  end

  def run
    puts display
    command = Command.build(gets.chomp)
    resp = robot.receive(command) if command.valid?
    self.display = resp.message if command.valid?
    puts display
  end
end

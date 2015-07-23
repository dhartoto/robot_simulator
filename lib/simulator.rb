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
    abort("Exiting simulator...Goodbye!") if command == 'EXIT'
    resp = robot.receive(command) if command.valid?
    self.display = command.error_message || resp.message
    puts display
  end
end

class Simulator
  attr_reader   :robot
  attr_accessor :display

  def initialize(robot)
    @display = "Welcome to Robot Simulator!"
    @robot   = robot
  end

  def run
    puts display
    command = gets.chomp
    resp = robot.receive(command)
    self.display = resp.message
    puts display
  end
end

class Simulator
  attr_reader :display, :robot

  def initialize(robot)
    @display = "Welcome to Robot Simulator!"
    @robot   = robot
  end

  def run
    puts display
    command = gets.chomp
    robot.receive(command)
  end
end

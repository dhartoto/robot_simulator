class Simulator
  attr_reader   :robot
  attr_accessor :display

  def initialize(robot)
    @display = instructions
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

  private

  def instructions
    "Issue the command 'PLACE' along with the board co-ordinates and bearing"\
      " to position the robot on the board. e.g. 'PLACE 0,1,NORTH'\n"\
      "You can also instruct the robot to carry out an action with the following"\
      " commands: 'MOVE', 'LEFT', 'RIGHT, 'REPORT'\n"\
      "Issue the command 'EXIT' to quit the simulator."
  end
end

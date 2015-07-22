class Simulator
  attr_reader :display

  def initialize
    @display = "Welcome to Robot Simulator!"
  end

  def run
    puts display
    command = gets.chomp
  end
end

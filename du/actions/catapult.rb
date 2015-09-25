require 'bundler/setup'
require 'dino'

class Catapult

  def initialize
    @board = Dino::Board.new(Dino::TxRx::Serial.new)
    @button = Dino::Components::Button.new(pin: 6, board: @board)
    @button.up do
      fire
    end
    @led = Dino::Components::Led.new(pin: 12, board: @board)
    @servo = Dino::Components::Servo.new(pin: 10, board: @board, position: 90)
  end

  def load
    puts 'loading'
    @servo.position = 1
  end

  def fire
    countdown(rand(5))
    @servo.position = 90
  end

  def countdown(seconds)
    signal
    system("afplay alert.mp3")
    system("afplay launch.mp3")
  end

  def signal
    [:on, :off].cycle(4) do |switch|
      @led.send(switch)
      sleep 0.5
    end
  end
end

__END__

irb -r' actions/catapult.rb'
catapult = Catapult.new
(pull spoon down)
catapult.load
(press button)

require 'bundler/setup'
require 'dino'
require 'byebug'

board = Dino::Board.new(Dino::TxRx::Serial.new)
servo = Dino::Components::Servo.new(pin: 10, board: board)
byebug
[0, 45, 90].cycle do |angle|
  servo.position = angle
  sleep 1
end


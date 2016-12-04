###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

code = []
current_position = Struct.new(:x, :y).new(1,1)
directions = File.readlines("input_day2.txt")
directions.map { |line| line.chomp }
map = [
  "123",
  "456",
  "789"
]

def get_next_position(direction, current_position)
  cp = current_position

  case direction
  when 'U' then cp.x -= 1 if cp.x > 0
  when 'D' then cp.x += 1 if cp.x < 2
  when 'L' then cp.y -= 1 if cp.y > 0
  when 'R' then cp.y += 1 if cp.y < 2
  end

  return cp
end

directions.each do |direction|
  direction.split('').each do |letter|
    current_position = get_next_position(letter, current_position)
  end
  code << map[current_position.x][current_position.y]
end

puts code.join

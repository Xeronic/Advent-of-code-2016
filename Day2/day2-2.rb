###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

code = []
current_position = Struct.new(:x, :y).new(3,1)
directions = File.readlines("input_day2.txt")
directions.map { |line| line.chomp }
map = [
  ".......",
  "...1...",
  "..234..",
  ".56789.",
  "..ABC..",
  "...D...",
  "......."
]

def get_char(x, y, map)
  puts map[x][y]
  return map[x][y]
end

def get_next_position(direction, current_position, map)
  cp = current_position

  case direction
  when 'U' then cp.x -= 1 unless get_char(cp.x - 1, cp.y, map) == '.'
  when 'D' then cp.x += 1 unless get_char(cp.x + 1, cp.y, map) == '.'
  when 'L' then cp.y -= 1 unless get_char(cp.x, cp.y - 1, map) == '.'
  when 'R' then cp.y += 1 unless get_char(cp.x, cp.y + 1, map) == '.'
  end

  return cp
end

directions.each do |direction|
  direction.split('').each do |letter|
    current_position = get_next_position(letter, current_position, map)
  end
  code << map[current_position.x][current_position.y]
end

puts code.join

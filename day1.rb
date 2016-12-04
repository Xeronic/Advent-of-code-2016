###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

x = y = 0
map = File.read('input_day1.txt').chomp.split(', ')
visits = []
first_visit = false
direction = 0

map.each do |move|
  direction += 90 if move[0] == 'R'
  direction -= 90 if move[0] == 'L'

  direction = 0 if direction >= 360
  direction = 270 if direction < 0

  steps = move[1..move.length].to_i

  steps.times do
    case direction
      when 0 then y += 1
      when 90 then x += 1
      when 180 then y -= 1
      when 270 then x -= 1
    end

    unless first_visit
      if visits.include? [x, y]
        @exercise2 = "Exercise 2: #{x.abs + y.abs} blocks away"
        first_visit = true
      else
        visits << [x, y]
      end
    end
  end
end

puts "Exercise 1: #{x.abs + y.abs} blocks away"
puts @exercise2

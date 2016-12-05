###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

input = File.readlines("input_day3.txt")
possible_triangles = File.readlines("input_day3.txt").map { |line| line.chomp.split.map(&:to_i) }

number_of_triangles = possible_triangles.reduce(0) do |total, triangle|
  triangle = triangle.sort
  total += 1 if triangle[0] + triangle[1] > triangle[2]
  total
end

puts number_of_triangles

###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

input = File.readlines("input_day3.txt")
possible_triangles = input.map { |line| line.chomp }
vertical_triangles = []

vertical_triangles = possible_triangles.each_slice(3).flat_map do |x, y, z|
  x = x.split.map(&:to_i)
  y = y.split.map(&:to_i)
  z = z.split.map(&:to_i)
  x.zip(y).zip(z).map(&:flatten)
end

number_of_triangles = vertical_triangles.select do |triangle|
  triangle = triangle.sort
  triangle[0] + triangle[1] > triangle[2]
end.size

p number_of_triangles

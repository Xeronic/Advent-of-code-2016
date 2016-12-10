###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

class Screen
  def initialize(x = 50, y = 6)
    @screen = Array.new(y)
    @screen.size.times do |index|
      @screen[index] = Array.new(x, 0)
    end
  end

  def rect(x, y)
    y.times do |t|
      @screen[t][0..x - 1] = Array.new(x, 1)
    end
  end

  def rotate_row(row, steps)
    steps.times { @screen[row].insert(0, @screen[row].pop) }
  end

  def rotate_col(col, steps)
    steps.times do
      new_col = []
      @screen.size.times do |index|
        index == 0 ? new_col << @screen[@screen.size - 1][col] : new_col << @screen[index - 1][col]
      end
      @screen.size.times do |index|
        @screen[index][col] = new_col.shift
      end
    end
  end

  def print_screen
    @screen.each do |row|
      row.each { |col| print col == 1 ? '#' : ' ' }
      puts
    end
  end

  def count_pixels
    @screen.flatten.select { |n| n == 1 }.size
  end
end

instructions = File.readlines("input").map { |line| line.chomp }
screen = Screen.new

instructions.each do |i|
  if i.start_with?("rect")
    row, col = i.split.last.split('x')
    screen.rect(row.to_i, col.to_i)
  else
    i = i.split
    i[1] == "row" ? screen.rotate_row(i[2].split('=').last.to_i, i.last.to_i) : screen.rotate_col(i[2].split('=').last.to_i, i.last.to_i)
  end
end

screen.print_screen
puts screen.count_pixels

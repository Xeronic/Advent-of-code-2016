###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

data = File.readlines("input").map { |line| line.chomp }
freq_table = []
8.times { freq_table << Hash.new(0) }

data.each do |row|
  row.split('').each_with_index do |letter, index|
    freq_table[index][letter] += 1
  end
end

freq_table = freq_table.map do |table|
  table = table.sort { |a, b| a.last <=> b.last }
  #table = table.sort { |a, b| b.last <=> a.last }
end

puts freq_table.map { |table| table.first.first }.join

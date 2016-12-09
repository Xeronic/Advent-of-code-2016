###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

data = File.readlines("input").map { |line| line.chomp }

def aba? (aba_array, bab_array)
  aba_array.each do |aba|
    (aba.length - 2).times do |index|
      if aba[index] == aba[index + 2] && aba != aba[index + 1]
        bab_array.each do |bab|
          (bab.length - 2).times do |i|
            return true if bab[i] == aba[index + 1] && bab[i + 1] == aba[index] && bab[i + 2] == aba[index + 1]
          end
        end
      end
    end
  end
  false
end

def abba? (text_array)
  text_array.each do |text|
    (text.length - 3).times do |index|
      return true if text[index] == text[index + 3] && text[index + 1] == text[index + 2] && text[index] != text[index + 1]
    end
  end
  false
end

def split_ip (ip_original)
  ip = ip_original.clone
  within_square = []
  while data = ip.slice(/\[(.*?)\]/)
    ip.gsub!(data, '#')
    within_square << data
  end
  within_square = within_square.map { |n| n.gsub('[', '').gsub(']', '') }
  [within_square, ip.split('#')]
end

abba_count = 0
aba_count = 0
data.each do |ip|
  within_square, outside_square = split_ip(ip)
  abba_count += 1 if abba?(outside_square) && !abba?(within_square)
  aba_count += 1 if aba?(outside_square, within_square)
end

puts abba_count
puts aba_count

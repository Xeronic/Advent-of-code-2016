###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

class Room
  attr_accessor :sector_id, :room_letters

  def initialize(room_encrypted)
    room_encrypted = room_encrypted.split('-')
    @sector_id = room_encrypted.pop[/\d+/]
    @room_letters = room_encrypted.join
  end

  def checksum
    freq = Hash.new(0)
    @room_letters.split('').each do |letter|
      freq[letter] += 1
    end

    freq = freq
      .sort { |a, b| a.last == b.last ? a.first <=> b.first : b.last <=> a.last }
      .map { |k, v| k }[0..4]
      .join

  end
end

input_rooms = File.readlines("input").map(&:chomp)
rooms = []

sector_sum = input_rooms.reduce(0) do |sum, ir|
  room = Room.new(ir)
  puts "#{room.checksum} :: #{ir} :: #{ir.split('[').last.gsub(']', '')}"
  sum += room.sector_id.to_i if ir.split('[').last.gsub(']', '') == room.checksum
  sum
end

puts sector_sum

###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###
require "crypto/md5"

seed = "ugkcyxxp"
password = ""
index = 0

start_time = Time.now
while 1
  hash = Crypto::MD5.hex_digest("#{seed}#{index}")
  if hash[0..4] == "00000"
    puts hash
    password += hash[5].to_s
    break if password.size == 8
  end
  index += 1
end
elapsed_time = Time.now - start_time

puts password
puts "Run took #{elapsed_time} seconds"

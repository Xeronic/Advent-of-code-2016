###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

require 'digest'
seed = "ugkcyxxp"
password = ''
index = 0

while 1
  hash = Digest::MD5.hexdigest(seed + index.to_s)
  if hash[0..4] == "00000"
    password << hash[5]
    break if password.length == 8
  end
  index += 1
end

puts password

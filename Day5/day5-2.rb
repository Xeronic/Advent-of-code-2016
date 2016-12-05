###
# Advent of code 2016
# Author Jerry Pedersen (jerry.ck.pedersen@gmail.com)
###

require "digest"
seed = "ugkcyxxp"
password = "________"
index = 0

while 1
  hash = Digest::MD5.hexdigest(seed + index.to_s)
  if hash[0..4] == "00000"
    if ('0'..'7').include? hash[5]
      password[hash[5].to_i] = hash[6] if password[hash[5].to_i] == '_'
      puts password
      break unless password.include? '_'
    end
  end
  index += 1
end

puts password

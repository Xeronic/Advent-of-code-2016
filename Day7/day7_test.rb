require 'minitest/autorun'
require './day7.rb'

class TestDay7 < Minitest::Test
  def setup
    @good_abba = ["abba[mnop]qrst", "ioxxoj[asdfgh]zxcvbn"]
    @bad_abba = ["aaaa[qwer]tyui", "abcd[bddb]xyyx"]
  end

  def test_good_string
    @good_abba.each do |bad|
      w, o = split_ip(bad)
      assert_equal true, abba?(o) && !abba?(w)
    end
  end

  def test_bad_string
    @bad_abba.each do |bad|
      w, o = split_ip(bad)
      assert_equal false, abba?(o) && !abba?(w)
    end
  end
end

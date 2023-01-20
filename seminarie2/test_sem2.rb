require './sem2'
require 'test/unit'

class MyTest < Test::Unit::TestCase

 def test_1a 

   re = Regexp.new(/\d{2}  -  \d{2}/)

    assert_equal("    8. Aston_Villa     38    12  14  12    46  -  47    50\n", sort("football.txt", re)[0])
    assert_equal("    9. Tottenham       38    14   8  16    49  -  53    50\n", sort("football.txt", re)[1])
    assert_equal("    3. Manchester_U    38    24   5   9    87  -  45    77\n", sort("football.txt", re)[-2])
    assert_equal("    1. Arsenal         38    26   9   3    79  -  36    87\n", sort("football.txt", re)[-1])
 end


def test_1b

   re = Regexp.new(/^(\s*\d{1,2} || \s*\w{2}\s*)\K (\d{2}\*?\.?\d*\s{2,4}\d{2}\*?\.?\d*)/)

   assert_equal("  14  61    59    60       5  55.9       0.00 RF      060  6.7 080   9 10.0  93 87 1008.6\n", sort("weather.txt", re)[0])
   assert_equal("  15  64    55    60       5  54.9       0.00 F       040  4.3 200   7  9.6  96 70 1006.1\n", sort("weather.txt", re)[1])
   assert_equal("   9  86    32*   59       6  61.5       0.00         240  7.6 220  12  6.0  78 46 1018.6\n", sort("weather.txt", re)[-1])
   assert_equal("  30  90    45    68          63.6       0.00 H       240  6.0 220  17  4.8 200 41 1022.7\n", sort("weather.txt", re)[-2])

end


end
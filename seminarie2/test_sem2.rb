require './sem2'
require 'test/unit'

class MyTest < Test::Unit::TestCase

 def test_1a 

    assert_equal("    8. Aston_Villa     38    12  14  12    46  -  47    50\n", sort_team("football.txt")[0])
    assert_equal("    9. Tottenham       38    14   8  16    49  -  53    50\n", sort_team("football.txt")[1])
    assert_equal("    3. Manchester_U    38    24   5   9    87  -  45    77\n", sort_team("football.txt")[-2])
    assert_equal("    1. Arsenal         38    26   9   3    79  -  36    87\n", sort_team("football.txt")[-1])
 end



end
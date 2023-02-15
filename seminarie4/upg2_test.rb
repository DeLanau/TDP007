require "./constraint-parser"
require "test/unit"

class MyTest < Test::Unit::TestCase
    def test_1
        cp = ConstraintParser.new
        c, f = cp.parse "9*c=5*(f-32)"
        f.user_assign(0)
        assert_equal(-18, c.value)
    end

end
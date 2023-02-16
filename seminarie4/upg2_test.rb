require "./constraint-parser"
require "test/unit"

class MyTest < Test::Unit::TestCase
    def test_1
        cp = ConstraintParser.new
        c, f = cp.parse("c+5=f")
        f.user_assign(8)
        assert_equal(3, c.value)
    end

    def test_2
        cp = ConstraintParser.new
        c, f = cp.parse("9*c=f")
        f.user_assign(9)
        assert_equal(1, c.value)
    end

    def test_3
        cp = ConstraintParser.new
        c, f = cp.parse("c=(3+f)")
        f.user_assign(1)
        assert_equal(4, c.value)
    end

    def test_4
        cp = ConstraintParser.new
        c, f = cp.parse("c=3*f")
        f.user_assign(1)
        assert_equal(3, c.value)
    end

    def test_5
        cp = ConstraintParser.new
        c, f = cp.parse("9*c=(f+10)")
        f.user_assign(8)
        assert_equal(2, c.value)
    end

    
    def test_6
        cp = ConstraintParser.new
        c, f = cp.parse("9*c=5*(f-32)")
        f.user_assign(0)
        assert_equal(-18, c.value)
    end
    
    def test_7
        cp = ConstraintParser.new
        c, f = cp.parse("9*c=5*(f-32)")
        f.user_assign(100)
        assert_equal(37, c.value)
    end
   
    def test_8
        cp = ConstraintParser.new
        c, f = cp.parse("c+3=f")
        f.user_assign(10)
        assert_equal(7, c.value)

        f.forget_value("user")
        f.user_assign(0)
        assert_equal(-3, c.value)
    end
    
    # def test_9
    #     cp = ConstraintParser.new
    #     c, f = cp.parse("5*c=5*(f+10)")
    #     f.user_assign(0)
    #     assert_equal(10, c.value)
    # end

    
end
require "./upg1"
require "./upg1-ver2"
require "./policy"
require "test/unit"

class MyTest < Test::Unit::TestCase
    def test_upg1
        per = Person.new("Volvo", "58435", 2, "M", 32)
        carl = Person.new("BMW", "58937", 2, "M" , 32)
        julia = Person.new("Fiat", "58647", 22, "F" , 40)
        
        assert_equal(15.66, per.evaluate_policy("policy.rb"))
        assert_equal(21.15, carl.evaluate_policy("policy.rb"))
        assert_equal(17, julia.evaluate_policy("policy.rb"))

    end

    def test_1
        per = Individual.new("Volvo", "58435", 2, "M", 32)
        carl = Individual.new("BMW", "58937", 2, "M" , 32)
        julia = Individual.new("Fiat", "58647", 22, "F" , 40)
        
        assert_equal(15.66, per.evaluate_policy("policy-ver2.rb"))
        assert_equal(21.15, carl.evaluate_policy("policy-ver2.rb"))
        assert_equal(17, julia.evaluate_policy("policy-ver2.rb"))
    end        
end

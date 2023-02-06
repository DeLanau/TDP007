require "./upg2"
require "test/unit"

class MyTest < Test::Unit::TestCase
    def test_1
        lang = Statement.new
        lang.log(false)

        assert(lang.parse("(set a true)"))
        assert_equal(true,lang.parse("a"))
        assert_equal(true, lang.parse("(or a false)"))
        assert_equal(true, lang.parse("(or false a)"))
        assert_equal(false, lang.parse("(not a)"))

        assert(lang.parse("(set d 2)"))
        assert_equal("2", lang.parse("(or d 1)"))
        assert_equal("1", lang.parse("(and d 1)"))
        
    end
end

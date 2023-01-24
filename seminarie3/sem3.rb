# coding: utf-8
class Person

  #car, postnummer, har haft körkort, kön, ålder
  def initialize(car, post, exp, gender, yo)
    @car = car
    @post = post
    @exp = exp
    @gender = gender
    @yo = yo
    @points = 0
  end

  def evaluate_policy(filename)

    self.instance_eval(File.read(filename))
    @points += @cars[@car]
    @points += @posts[@post]
    @points += @experience[@exp]
    @points += @genders[@gender]
    @years += @years[yo]
    return @points
  end
end

per = Person.new("Volvo", "58435", 2, "M", 32)
puts per.evaluate_policy("policy.rb")

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
    @points += @years[yo]

    if @gender == "M" && @xp > 3 then
      @points = @points * 0.9
    end

    if @car == "Volvo" && @post.match(/^(58)/) then
      @points = @points * 1.2 
    end

    return @points
  end

end

per = Person.new("Volvo", "58437", 2, "M", 32)
puts per.evaluate_policy("policy.rb")

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

#rules som kan utåkas eller ändras beroende på olika policy. 
  def rules()

    if @gender == "M" and @exp < 3 then
      @points *= 0.9
      puts 1 
    end
  
    if @car == "Volvo" and @post.match(/^(58)/) then
      @points *= 1.2
      puts 2
    end
    
  end 

  def evaluate_policy(filename)

    #läser in filen och kör den som ruby kod. 
    self.instance_eval(File.read(filename))

    #okar points beroende av key : value från tabel
    @points += @cars[@car]

    #check för nil value, om post nummer finns inte med i tabel
    if @posts[@post] != nil then
      @points += @posts[@post]
    end
    #för att få rätt värde, går igenom select tills exp ligger i rätt interval. sedan för value av den 
    @points += @experience.select {|e| e === @exp}.values.first
    @points += @genders[@gender]
    @points += @years.select {|e| e === @yo}.values.first 

    #utför rules från policy 
    rules()
    
    return @points.round(2)
  end

end

#per = Person.new("Volvo", "58435", 2, "M", 32)
#puts per.evaluate_policy("policy.rb").class

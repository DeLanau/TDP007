# coding: utf-8
#alla dict med key : value representerar olika tabel. 
@cars = {

  "BMW" => 5,
  "Citroen" => 4,
  "Fiat" => 3,
  "Ford" => 4,
  "Mercedes" => 5,
  "Nissan" => 4,
  "Opel" => 4,
  "Volvo" => 5
  
}


@posts = {

  "58937" => 9,
  "58726" => 5,
  "58647" => 3
}

@experience = {

  0..1 => 3,
  2..3 => 4,
  4..15 => 4.5,
  16..99 => 5
  
}

@genders = {

  "M" => 1,
  "F" => 1
  
}

@years = {

  18..20 => 2.5,
  21..23 => 3,
  24..26 => 3.5,
  27..29 => 4,
  30..39 => 4.5,
  40..64 => 5,
  65..70 => 4,
  71..99 => 3
  
}

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

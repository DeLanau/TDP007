class Individual

    #car, postnummer, har haft körkort, kön, ålder
    def initialize(car = '', post = '', exp = '', gender = '', yo = '')
        @car = car
        @post = post
        @exp = exp
        @gender = gender
        @yo = yo
        @points = 0
    end
    

    def evaluate_policy(filename)
        #läser in filen och kör den som ruby kod. 
        self.instance_eval(File.read(filename))
        rules()
        p @points.round(2)
    end   

    def method_missing(name, *args)
        if args.empty?
            p "#{name} "

        else
            #p "#{name}  #{args}"
            if name.to_s == @car then
                @points += args[0]
            end

            if name.to_s.split('_')[0] == "zip" and name.to_s.split('_')[1] == @post then
                @points += args[0]
            end
            
            if name.to_s.split('_')[0] == "exp" then
                calc_range(name, @exp, args)
            end
            
            if name.to_s.split('_')[0] == @gender then
                @points += args[0]
            end

            if name.to_s.split('_')[0] == "age" then
                calc_range(name, @yo, args)
            
            end
        end
    end
    def rules()

        if @gender == "M" and @exp < 3 then
            @points *= 0.9
        end
          
        if @car == "Volvo" and @post.match(/^(58)/) then
            @points *= 1.2
        end

    end 

    def calc_range(name, type, args)
        range = name.to_s.split('_')[1].to_i..name.to_s.split('_')[2].to_i
        if range.include?(type) then
            @points += args[0]
        end
    end
    
    
end
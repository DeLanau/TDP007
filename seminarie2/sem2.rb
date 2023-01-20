'''Uppgift 1a'''
def file_to_list(name, re)

    file = File.open(name).readlines().map()
    re = Regexp.new(re)
    list = []

    for f in file do

        if f =~ re then
            list.push(f)
        end
    end

    return list
end

#puts sort_team("football.txt")

def sort(name, re) 

    teams = file_to_list(name, re)

    re = Regexp.new(re)

    teams.sort_by! do |t|

        t = t.slice(re) # "12   -   12" "12    12"

        a = t[0..2].to_i
        b = t[-4..-1].to_i
        
        diff = 0

        if a < b then
            diff = b - a 
        else
            diff = a - b 
        end 
    end 

    return teams
end 

#^(\s*(\d{1,2} || \w{2})\s*)(\d{2}\*?\.?\d*\s{2,4}\d{2}\*?\.?\d*)

#^(\s*\d{1,2} || \s*\w{2}\s*)\K (\d{2}\*?\.?\d*\s{2,4}\d{2}\*?\.?\d*)
#(/\d{2}  -  \d{2}/


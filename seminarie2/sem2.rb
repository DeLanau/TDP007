'''Uppgift 1a'''
def file_to_list(name)

    file = File.open(name).readlines().map()

    list = []

    for f in file do

        if f =~ /\d{2}  -  \d{2}/ then
            list.push(f)
        end
    end

    return list
end

def sort_team(name) 

    teams = file_to_list(name)

    teams.sort_by! do |t|

        t = t.slice(/\d{2}  -  \d{2}/)

        a = t[0..2].to_i
        b = t[7..9].to_i

        diff = 0

        if a < b then
            diff = b - a 
        else
            diff = a - b 
        end 
        
    end 

    return teams
end 

puts sort_team("football.txt")

def sort_team(name) 

    teams = file_to_list(name)

    teams.sort_by! do |t|

        t = t.slice(/\d{2}  -  \d{2}/) # "12   -   12"

        a = t[0..2].to_i
        b = t[7..9].to_i

        diff = 0

        if a < b then
            diff = b - a 
        else
            diff = a - b 
        end 
        
    end 

    return teams
end 

str = "1  88*    59*    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5"

puts str.slice(/\d{2}\*?    \d{2}\*?/)[0..2].to_i #^(\s*(\d{1,2} || \w{2})\s*)(\d{2}\*?\.?\d*\s{2,4}\d{2}\*?\.?\d*)

# for f in teams do
        
#     if f =~ /\d{2}  -  \d{2}/ then

#         f = f.slice(/\d{2}  -  \d{2}/)

#         a = f[0..2].to_i
#         b = f[7..9].to_i

#         diff = 0

#         if a < b then
#             diff = b - a 
#         else
#             diff = a - b 
#         end 
        
#         differens.push(diff)
    
#     end 
# end
# return differens.sort[0]
'''Uppgift 1'''
def file_to_list(name, re)

    file = open(name, "r") #File.open(name).readlines().map()
    re = Regexp.new(re)
    list = []
 
    for f in file do

        if f =~ re then
            list.push(f)
        end
    end

    file.close

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

''' Uppgift 2 ''' 
require 'rexml/document'
require 'rexml/element'

require 'open-uri'

class Event_Day

    attr_accessor :summary, :date, :location, :desc

    def initialize(summary, date, location, desc)
        @summary = summary
        @date = date
        @location = location
        @desc = desc
    end

end

def el_to_list()

    src_html = URI.open('https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html').read
    doc2 = REXML::Document.new src_html
    r = doc2.root

    list = []

    r.elements.each("//div[@class='vevent']") do |n| 

        el = REXML::Element.new n
    
        list.push(n)
    
    end

    return list
end 

def get_span(list, pos, tag)

    list[pos].each_element(".//span") {
    |e| if e.inspect.include? tag
            return e.text.to_s
        end
    }
end

list = el_to_list
puts list[0]
puts get_span(list, 0, "summary")

day = Event_Day.new(
    get_span(list, 0, "summary"), 
    get_span(list, 0, "dtstart"), 
    get_span(list, 0, "locality"), 
    get_span(list, 0, "region"))

puts "Test:"

puts day.summary
puts day.date
puts day.location
puts day.desc

#puts list

#puts doc.elements[7].methods

#summary+date+location+desc#

=begin 


   day = Event_Day.new

    if n.inspect.include? "summary" &&  
        day.summary = n.text
    else n.inspect.include? "dtstart"
        day.date = n.text
    end
    list.push(day)

=end

=begin 

    .läsa websidan.
    .skapa händelse - event med data, dagen, månad, beskrivning. 
    .lägga info till list med alla händelser.
    .skriva ut. 

=end
'''Uppgift 1'''
#skapa lista från fil som tar namn och regex som inparametrar, returnerar en lista med alla rader från textfilen.
def file_to_list(name, re)

    file = open(name, "r") 
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

#sorterar radernna från listan utifrån regex som fylls i som inparameter tillsammans med listan. Returnerar sorterade raderna. 
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

''' Uppgift 2 ''' 
require 'rexml/document'
require 'rexml/element'
require 'open-uri'

#Eventet blir ett objekt som har viktig information kring eventet. 
class Event_Day

    attr_accessor :summary, :date, :location, :region

    def initialize(summary, date, location, region="")
        @summary = summary
        @date = date
        @location = location
        @region = region
    end

end

#skapa lista med alla element under div med attributen class='vevent'
def el_to_list(link = "https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html")

    src_html = URI.open(link).read
    doc2 = REXML::Document.new src_html
    r = doc2.root

    list = []

    r.elements.each("//div[@class='vevent']") do |n| 

        el = REXML::Element.new n
    
        list.push(n)
    
    end

    return list
end 

#hämta text från lista av element på position pos, som innehåller tag 
def get_span(list, pos, tag)

    list[pos].each_element(".//span") {
    |e| if e.inspect.include? tag
            return e.text.to_s
        end
    }
end

#skapa lista av Event_Day
def create_day_list

    list = el_to_list("https://www.ida.liu.se/~TDP007/current/material/seminarie2/events2.html")

    event_day_list = []

    list.each_index do |index|
        event_day_list.push(Event_Day.new(
        get_span(list, index, "summary"), 
        get_span(list, index, "dtstart"), 
        get_span(list, index, "locality")))
    end
    
    return event_day_list
end

#vissa en element från lista på position pos 
def display_element(list, pos)

    puts "Summary: " + list[pos].summary
    puts "Date: " + list[pos].date
    puts "Locality: " + list[pos].location
    puts "-------------------------------------"

end 

#visa alla element i lista
def display(list)

    list.each_index do |i|
        display_element(list, i)
    end 
end 
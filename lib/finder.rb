# require_relative 'db'
# class Finder
#
#   attr_reader :sort, :database, :queue, :parameters
#   attr_accessor :db
#
#   def initialize(database)
#     @db              = DB.read("./data/event_attendees.csv")
#     @sort    = []
#     @database = database
#     @queue           = []
#     @parameters      = ""
#
#   end
#
#
#   def find(parts)
#     case parts[1]
#     when "first"   then find_first(parts)
#     when "last"    then find_last(parts)
#     when "city"    then find_city(parts)
#     when "state"   then find_state(parts)
#     when "zipcode" then find_zipcode(parts)
#     end
#   end
#
#   def find_first(parts)
#     @parameters =  parts[3..-1].join(" ")
#     @sort       = @db.find_by_first_name(@parameters.capitalize)
#   end
#
#   def find_last(parts)
#     @parameters = parts[3..-1].join(" ")
#     @sort       = db.find_by_last_name(@parameters.capitalize)
#   end
#
#   def find_city(parts)
#     @parameters = parts[2..-1].join(" ")
#     @sort       = db.find_by_city(@parameters)
#   end
#
#   def find_state(parts)
#     @parameters = parts[2..-1].join(" ")
#     @sort       = db.find_by_state(@parameters.upcase)
#   end
#
#   def find_zipcode(parts)
#     @parameters = parts[2..-1].join(" ")
#     @sort       = zip_sort = db.find_by_zipcode(@parameters)
#   end
#
#   def queue(parts)
#     case
#     when parts[1]  == "count"
#       puts "There are #{@sort.count} entiries in the queue"
#       puts "\n"
#     when parts[1] == "clear"
#       @sort = []
#     when parts[1] == "print"
#       print_attendees(@sort)
#     when parts[2] == "by"
#       print_attendees(@sort)
#     when parts[2] == "to"
#       puts "QUEUE SAVE TO WORKING!"
#     else
#       puts "That's not a valid option for queue."
#     end
#   end
#
#   def print_attendees(sorted_info)
#     print "-----------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
#     print "LAST".ljust(20) + "FIRST".ljust(15) +
#     "ZIP".ljust(8) + "CITY".ljust(20) + "STATE".ljust(8) + "STREET".ljust(45) +
#     "PHONE".ljust(13) + "EMAIL".ljust(1)
#     print "\n"
#     print "-----------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
#       sorted_info.each do |key|
#       print "#{key.last_name.ljust(20)} #{key.first_name.ljust(15)}" +
#       "#{key.zipcode.ljust(8)}" +
#       "#{key.city.ljust(20)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(45)}" +
#       "#{key.homephone.ljust(13)}" + "#{key.email_address.ljust(1)}"
#       print "\n"
#     end
#   end
#
#
#
#
# end

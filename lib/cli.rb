require_relative 'db'


class CLI
  def self.run
    database = DB.read("./data/event_attendees.csv")
    new(database).start
  end

  attr_reader :queue,
              :command,
              :parameters,
              :criteria,
              :database,
              :first_name_sort

  attr_accessor            :db

  def initialize(database)
    @queue      = []
    @command    = ""
    @parameters = ""
    @criteria   = ""
    @database   = database
    @db         = DB.read("./data/event_attendees.csv")
    @first_name_sort = first_name_sort
  end

  def start
    puts "Welcome to Event Reporer!"
    until command == "quit"
      print "Enter your command: "
      parts = process_input(gets.strip)
      execute_command(parts)
    end
    puts "Good Bye!"
  end

  def process_input(input)
    input.split
  end

  def format_parameters(parameters)
    parameters.join(" ").gsub('"', '')
  end

  def execute_command(parts)
    case parts[0]
    when "load"
      @command    = parts[0]
      @parameters = parts[1..-1].pop
      puts "LOADING: #{parameters}"
      DB.read("./data/#{parameters}")
    when "help"
      help(parts)
    when "find"
      find(parts)
    when "queue"
      queue(parts)
    when "quit"
      @command  = parts[0]
    else
      puts "I don't know the '#{parts[0..-1].join(" ")}' command. \nTo know the available functions in Event Reporter, please type help."
    end
  end

  def find(parts)
    case
      when parts[1] == "first"
        @parameters =  parts[3..-1].join(" ")
        first_name_sort = db.find_by_first_name(@parameters)
    end
      when parts[1] == "last"
        @parameters = parts[3..-1].join(" ")
        last_name_sort = db.find_by_last_name(@parameters)
      when parts[1] == "city"
        @parameters = parts[2..-1].join(" ")
        db.find_by_city(@parameters)
      when parts[1] == "state"
        @parameters = parts[2..-1].join(" ")
        db.find_by_state(@parameters)
      when parts[1] == "zipcode"
        @parameters = parts[2..-1].join(" ")
        zip_sort = db.find_by_zipcode(@parameters)
      end
  end

  def help(parts)
    @command    = parts[0..-1]
      case
      when parts[3] == "by"
        puts "The instructions of 'queue printing by'"
      when parts[3] == "to"
          puts "'queue save to' instructions"
      when parts[2] == "clear"
        puts "'Queue clear' instructions..."
      when parts[2] == "print"
          puts "'Queue print' instructions"
      when parts[1] == nil
        puts "The available commands are..."
      when parts[1] == "queue"
        puts "'Queue' instructions"
      when parts[1] == "load"
          puts "'Load' Instructions..."
      when parts[1] == "find"
        puts "'find' instructions..."
      else
        puts "Sorry, but '#{parts[1..-1].join(" ").upcase}' is not a valid command for Help Section."
      end
  end

  def queue(parts)
    case
      when parts[1]  == "count"
        puts "QUEUE COUNT WORKING!"
        @command    = parts[0..1]
        @parameters = parts[2..-1]
      when parts[1] == "clear"
        puts "QUEUE CLEAR WORKING!"
      when parts[1] == "print"
        puts "QUEUE PRINT WORKING!"
      when parts[2] == "by"
        puts "QUEUE PRINT BY WORKING!"
      when parts[2] == "to"
        puts "QUEUE SAVE TO WORKING!"
      else
        puts "That's not a valid option for queue."
      end
  end


  # def print_attendees
  #   print "FIRST".ljust(11) + "LAST".ljust(15) + "EMAIL".ljust(31) +
  #   "ZIP".ljust(10) + "CITY".ljust(15) + "STATE".ljust(8) + "STREET".ljust(20) +
  #   "PHONE".ljust(20)
  #   print "\n"
  #     @records.each do |key|
  #     print "#{key.last_name.ljust(10)} #{key.first_name.ljust(15)}" +
  #     "#{key.email_address.ljust(30)} #{key.zipcode.ljust(10)}" +
  #     "#{key.city.ljust(15)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(20)}" +
  #     "#{key.homephone.ljust(1)}"
  #     print "\n"
  #   end
  # end

end

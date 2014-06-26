require_relative 'db' && 'leyends'

class CLI
  def self.run
    database = DB.read("./data/event_attendees.csv")
    new(database).start
  end

  attr_reader :queue,
              :command,
              :parameters,
#              :criteria,
              :database,
              :sort

  attr_accessor :db

  def initialize(database)
    @queue           = []
    @command         = ""
    @parameters      = ""
    #@criteria        = ""
    @database        = database
    @db              = DB.read("./data/event_attendees.csv")
    @sort            = []
    @leyend          = Leyends.new
  end

  def start
    @leyend.wellcome
    until command == "quit"
      @leyend.print_command
      parts = process_input(gets.strip)
      execute_command(parts)
    end
    @leyend.close_program
  end

  def process_input(input)
    input.split
  end

  def format_parameters(parameters)
    parameters.join(" ").gsub('"', '')
  end

  def execute_command(parts)
    case parts[0]
    when "load"   then loading_file(parts)
    when "help"   then help(parts)
    when "find"   then find(parts)
    when "queue"  then queue(parts)
    when "quit"   then @command  = parts[0]
    else puts "I don't know the '#{parts[0..-1].join(" ")}' command. \nTo know the available functions in Event Reporter, please type help."
    end
  end

  def loading_file(parts)
    case
    when parts[1] == nil then @leyend.load_incomplete
    when parts[1] != nil then
      loading_exeption(parts)
    end
  end

  def loading_exeption(parts)
    begin
      @parameters = parts[1..-1].pop
      DB.read("./data/#{parameters}")
      puts "LOADING: #{parameters}"
    rescue
      puts "there is not such file."
    end
  end


  def find(parts)
    case parts[1]
    when "first"
      @parameters =  parts[3..-1].join(" ")
      @sort       = db.find_by_first_name(@parameters.capitalize)
    when "last"
      @parameters = parts[3..-1].join(" ")
      @sort       = db.find_by_last_name(@parameters.capitalize)
    when "city"
      @parameters = parts[2..-1].join(" ")
      @sort       = db.find_by_city(@parameters)
    when "state"
      @parameters = parts[2..-1].join(" ")
      @sort       = db.find_by_state(@parameters.upcase)
    when "zipcode"
      @parameters = parts[2..-1].join(" ")
      @sort       = zip_sort = db.find_by_zipcode(@parameters)
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
      puts "There are #{@sort.count} entiries in the queue"
      puts "\n"
    when parts[1] == "clear"
      @sort = []
    when parts[1] == "print"
      print_attendees(@sort)
    when parts[2] == "by"
      print_attendees(@sort)
    when parts[2] == "to"
      puts "QUEUE SAVE TO WORKING!"
    else
      puts "That's not a valid option for queue."
    end
  end

  def print_attendees(sorted_info)
    print "-----------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
    print "LAST".ljust(20) + "FIRST".ljust(15) +
    "ZIP".ljust(8) + "CITY".ljust(20) + "STATE".ljust(8) + "STREET".ljust(45) +
    "PHONE".ljust(13) + "EMAIL".ljust(1)
    print "\n"
    print "-----------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
      sorted_info.each do |key|
      print "#{key.last_name.ljust(20)} #{key.first_name.ljust(15)}" +
      "#{key.zipcode.ljust(8)}" +
      "#{key.city.ljust(20)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(45)}" +
      "#{key.homephone.ljust(13)}" + "#{key.email_address.ljust(1)}"
      print "\n"
    end
  end
end

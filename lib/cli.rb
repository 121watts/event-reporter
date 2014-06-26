require_relative 'db' && 'legends' && 'helper' && 'printer' && 'colors'

class CLI
  def self.run
    database = DB.read("./data/event_attendees.csv")
    new(database).start
  end

  attr_reader   :queue,
                :command,
                :parameters,
                :database,
                :sort
                :parts
  attr_accessor :db

  def initialize(database)
    @queue           = []
    @command         = ""
    @parameters      = ""
    @database        = database
    @db              = DB.read("./data/event_attendees.csv")
    @sort            = []
    @legend          = Legends.new
    @helper          = Helper.new
    @printer         = Printer.new
    @parts           = []
  end

  def start
    @legend.welcome

    until command == "quit"
      @legend.print_command
      parts = process_input(gets.strip)
      execute_command(parts)
    end
    @legend.close_program
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
    when "help"   then @helper.help(parts)
    when "find"   then find(parts)
    when "queue"  then queue(parts)
    when "quit"   then @command  = parts[0]
    else @legend.missing_command
    end
  end

  def loading_file(parts)
    case
    when parts[1] == nil then @legend.load_incomplete
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
      @legend.load_no_file
    end
  end

  def find(parts)
    case parts[1]
    when "first"   then find_first(parts)
    when "last"    then find_last(parts)
    when "city"    then find_city(parts)
    when "state"   then find_state(parts)
    when "zipcode" then find_zipcode(parts)
    end
  end

  def find_first(parts)
    @parameters =  parts[3..-1].join(" ")
    @sort       = db.find_by_first_name(@parameters.capitalize)
  end

  def find_last(parts)
    @parameters = parts[3..-1].join(" ")
    @sort       = db.find_by_last_name(@parameters.capitalize)
  end

  def find_city(parts)
    @parameters = parts[2..-1].join(" ")
    @sort       = db.find_by_city(@parameters)
  end

  def find_state(parts)
    @parameters = parts[2..-1].join(" ")
    @sort       = db.find_by_state(@parameters.upcase)
  end

  def find_zipcode(parts)
    @parameters = parts[2..-1].join(" ")
    @sort       = zip_sort = db.find_by_zipcode(@parameters)
  end

  def queue(parts)
    case
    when parts[2] != nil then queue_third_position_of_the_array(parts)
    when parts[1] != nil then queue_second_position_of_the_array(parts)
    when parts[1] == nil then puts @legend.queue_needs_commands
    else @legend.queue_wrong_command
    end
  end

  def queue_third_position_of_the_array(parts)
    case parts[2]
    when "by" then @printer.print_attendees(@sort)
    when "to" then @legend.queue_saved
    else @legend.queue_wrong_command
    end
  end

  def queue_second_position_of_the_array(parts)
    case parts[1]
    when "clear" then @sort = []
    when "print" then @printer.print_attendees(@sort)
    when "count" then @legend.count_result(@sort)
    else @legend.queue_wrong_command
    end
  end

end

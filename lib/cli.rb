class CLI
  def self.run
    database = DB.read("../data/")
    new(database).start
  end

  attr_reader :command,
              :parameters,
              :database

  def initialize(database)
    @queue      = []
    @command    = ""
    @parameters = ""
    @database   = database
  end

  def start
    puts "Welcome to Event Reporer!"
    while command != "quit"
      print "Enter your command: "
      parts = process_input(gets.chomp)
      assign_instructions(parts)
      execute_command
    end
    puts "Good bye"
  end

  def proceess_input(input)
    input.split(" ")
  end

  def assign_instructions(parts)
    @command    = parts[0]
    @parameters = format_parameters(parts[1..-1])
  end

  def format_parameters(parameters)
    parameters.join(" ").gsub('"', '')
  end

  def execute_command
    puts "Executing #{command}..."

    case command
    when "load"
      #do this
    when "help"
      #do this
    when "help load"
      #do this
    when "help queue"
      #do this
    when "help queue clear"
      #do this
    when "help queue print"
      #do this
    when "help queue print by"
      #do this
    when "help queue save to"
      #do this
    when "help find"
      #do this
    when "queue count"
      #do this
    when "queue clear"
      #do this
    when "queue print"
      #do this
    when "queue print by"
      #do this
    when "queue save to"
      #do this
    end
  end


end

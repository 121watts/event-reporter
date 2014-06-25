#
# class CLI
#   attr_reader :command, :event_reporter, :parameters
#
#   def initialize(event_reporter)
#     @command        = ''
#     @parameters     = ''
#     @event_reporter = event_reporter
#   end
#
#   def start
#     puts "Welcome to Event Reporter!"
#     while command != "quit"
#       print "Enter your command: "
#       parts = process_input(gets.chomp)
#       assign_instructions(parts)
#       execute_command
#     end
#     puts "Good bye."
#   end
#
#   def process_input(input)
#     input.split(" ")
#   end
#
#   def assign_instructions(parts)
#     case
#     when parts[0] == "load"
#       @command     = parts[0]
#       @parameters  = parts[1]
#     else
#       puts "goodbye"
#     end
#   end
#

  #
  #   when parts[0..1] == "help"
  #     #do this
  #   when parts[0..2] =="help "
  #
  #   when parts[0]   == "queue"
  #     case
  #     when parts[1] == "count"
  #       #do this
  #     when parts[1] == "clear"
  #       #do this
  #     when parts[1..2] == "print"
  #       case
  #       when parts[2] == #attribute LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE
  #         #do this
  #
  #
  #       when
  #       else
  #         puts "I don't know that command."
  #       end
  #
  #     when parts[0] == "find"
  #       #do this
  #     else
  #       print "I don't recognize that instruction."
  #     end
  #   end
  # end


  #######          EMERGENCY!  !############
  #######  PLEASE REFACTOR ME  !############
  #######  PLEASE REFACTOR ME  !############
  #######  PLEASE REFACTOR ME  !############
  #######  PLEASE REFACTOR ME  !############








































  # if parts[1] == "-r"
  #   @command    = parts[0..1].join(" ")
  #   @parameters = format_parameters(parts[2..-1])
  # else
  #   @command    = parts[0]
  #   @parameters = format_parameters(parts[1..-1])
  # end




  # accepted commands:
  # load <filename>
  # help
  # help <command>
  # queue count
  # queue clear
  # queue print
  # queue print by <attribute>
  # queue save to <filename.csv>
  # find <attribute> <criteria>

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  # MasterMind
  #
  #   def start
  #
  ###     print @leyends.initial_instructions
  ###     @initial_input  = gets.chomp
  #
  #     case
  #     when initial_input == "w"
  #       puts @leyends.wisdom
  #     when initial_input == "h"
  #       puts @leyends.wellcome_hero
  #       puts @art.dalek
  #       @cronometer.time_start
  #
  #       until command == "q"
  #         print @leyends.hurry_up
  #         @command  = gets.chomp
  #
  #         evaluator = Evaluator.new(command.chars, sequence)
  #         colors    = evaluator.color_included
  #         positions = evaluator.match_position
  #
  #         case
  #         when positions == 4
  #           puts "  >>> It's Awesome that you find #{sequence}"
  #           @cronometer.time_finish
  #           puts @cronometer.time_duration
  #           puts @leyends.perfect_match
  #         when positions > 0 || colors > 0
  #           puts "\n>>> You are close, but only have #{positions} perfect guesses with #{colors} right colors\n\n"
  #         else
  #           puts @leyends.unmatched
  #         end
  #       end
  #     else
  #       puts @leyends.none_sense_response
  #     end
  #   end
  # end

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  #CSV II
  #class CLI
  #   def self.run
  #     repository = EntryRepository.in("./data")
  #     phone_book = PhoneBook.new(repository)
  #     new(phone_book).start
  #   end
  #
  #   attr_reader :command,
  #               :parameters,
  #               :phone_book
  #
  #   def initialize(phone_book)
  #     @command    = ""
  #     @parameters = ""
  #     @phone_book = phone_book
  #   end
  #
  #   def start
  #     puts "Welcome to CSV."
  #     while command != "quit"
  #       print "Enter your command: "
  #       parts = process_input(gets.chomp)
  #       assign_instructions(parts)
  #       execute_command
  #     end
  #     puts "Good bye."
  #   end
  #
  #   def process_input(input)
  #     input.split(" ")
  #   end
  #
  #   def assign_instructions(parts)
  #     if parts[1] == "-r"
  #       @command    = parts[0..1].join(" ")
  #       @parameters = format_parameters(parts[2..-1])
  #     else
  #       @command    = parts[0]
  #       @parameters = format_parameters(parts[1..-1])
  #     end
  #   end
  #
  #   def format_parameters(parameters)
  #     parameters.join(" ").gsub('"', '')
  #   end
  #
  #   def execute_command
  #     puts "Executing #{command}..."
  #
  #     case command
  #     when "lookup"
  #       output = phone_book.lookup(parameters)
  #       puts output
  #       output
  #     when "lookup -r"
  #       output = phone_book.reverse_lookup(parameters)
  #       puts output
  #       output
  #     end
  #   end
  # end

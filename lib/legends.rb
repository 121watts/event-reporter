class Legends

  def welcome
    puts "\nWelcome to Event Reporter!!".blue
  end

  def print_command
    print "\nType your command here: "
  end

  def close_program
    puts "\nGoodbye, we hope Event Reporter was helpful for you."
  end

  def need_file
    "\nPlease specify a file to load."
  end

  def load_incomplete
    puts "\nYou need to specify a file to load.\n" +
         "\nFor example, type: load yourfilename.csv\n"
  end

  def load_no_file
    puts "\nThere is no such file.\nPlease try again with a real filename."
  end

  def missing_command
    puts "\nSorry, but this is not a valid command.\nTo know the available functions in Event Reporter, please type help."
  end

  def queue_saved
    puts "\nThe queue is saving the file."
  end

  def queue_wrong_command
    puts "\nThat command is not available on queue.\nYou can type the word 'help' for mor instructions."
  end

  def queue_needs_commands
    puts "\nTo use queue you need to give more instructions. Please type 'help' if you need more directions."
  end

  def count_result(sort)
    puts "\nThere are #{sort.count} entries in the queue.\n\n"
  end

  def available_commands
    puts "\nAVAILABLE COMMANDS:\n" +
         "\n'load <filename>' - to load file you would like to search" +
         "\n'queue count' - counts your current attendee search" +
         "\n'queue clear' - clears most recent attendee search" +
         "\n'queue print by <attribute>' - prints attendees by various attributes" +
         "\n'queue save to <desired file name>'" +
         "\n'find <attribute> <criteria>'\n" +
         "\n  <attribute> can be - first name, last name, city, state, and zipcode\n" +
         "\n  example search: find first name John\n" +
         "\n                  find last name Watkins\n" +
         "\n                  find state DC"
  end
end

class Legends

  def welcome
    puts "Welcome to Event Reproter!!".red
  end

  def print_command
    print "Type your command here: "
  end

  def close_program
    puts "Goodbye, we hope Event Reporter was helpful for you."
  end

  def need_file
    "You need to specify a file to load."
  end

  def load_incomplete
    puts "You need to specify a file to load.\nPlease try again."
  end

  def load_no_file
    puts "There is no such file.\nPlease try again with a real filename."
  end

  def missing_command
    puts "Sorry, but this is not a valid command.\nTo know the available functions in Event Reporter, please type help."
  end

  def queue_saved
    puts "The queue is saving the file."
  end

  def queue_wrong_command
    puts "That command is not available on queue.\nYou can type the word 'help' for mor instructions."
  end

  def queue_needs_commands
    puts "To use queue you need to give more instructions. Please type 'help' if you need more directions."
  end

  def count_result(sort)
    puts "There are #{sort.count} entries in the queue.\n\n"
  end

  def available_commands
    puts "Welcome tho Event Reporter.\n"
  end




end

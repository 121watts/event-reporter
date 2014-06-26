class Helper

  attr_reader :help

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




end

require_relative 'legends'

class Helper

  def initialize
    @legend = Legends.new
  end

  def help(parts)
    case
    when parts[3] != nil then help_three(parts)
    when parts[2] != nil then help_two(parts)
    when parts[1] != nil then help_one(parts)
    when parts[1] == nil then @legend.available_commands
    else @legend.missing_command
    end
  end

  def help_three(parts)
    case parts[3]
    when "by" then puts "Type 'queue print <attribute>' Attributes include: "
                        +"\nfirst name, last name, zipcode, city, and state."
    when "to" then puts "Type 'queue save to <filename.extension of your choice>'" +
                        "\n to save file\n"
    else @legend.missing_command
    end
  end

  def help_two(parts)
    case parts[2]
    when "clear" then puts "Type 'queue clear' to clear current queue.\n"
    when "print" then puts "Type 'queue print' to print current queue.\n"
    when "count" then puts "Type 'queue count' to find out how many attendees are in your current queue search\n"
    else @legend.missing_command
    end
  end

  def help_one(parts)
    case parts[1]
    when "queue" then puts "Available commands for 'queue' are:" +
                           "\n'print'\n'count'\n'cleart'\n'save to'" +
                           "\n'print by'\n"
    when "load" then puts "\ntype: load yourfilename.csv\n"
    when "find" then puts "\njust type 'help' for all find commands'\n"
    else @legend.missing_command
    end
  end
end

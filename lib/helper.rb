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
    when "by" then puts "The instructions of 'queue print by'"
    when "to" then puts "'queue save to' instructions"
    else @legend.missing_command
    end
  end

  def help_two(parts)
    case parts[2]
    when "clear" then puts "'Queue clear' instructions..."
    when "print" then puts "'Queue print' instructions"
    else @legend.missing_command
    end
  end

  def help_one(parts)
    case parts[1]
    when "queue" then puts "'Queue' instructions"
    when "load" then puts "'Load' Instructions..."
    when "find" then puts "'find' instructions..."
    else @legend.missing_command
    end
  end
end

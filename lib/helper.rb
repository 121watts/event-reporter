require_relative 'legends'

class Helper

  def initialize
    @legend = Legends.new
  end

  def help(parts)
    case
    when parts[3] != nil then help_fourth_position_of_the_array(parts)
    when parts[2] != nil then help_third_position_of_the_array(parts)
    when parts[1] != nil then help_second_position_of_the_array(parts)
    when parts[1] == nil then @legend.available_commands
    else @legend.missing_command
    end
  end

  def help_fourth_position_of_the_array(parts)
    case parts[3]
    when "by" then @legend.help_queue_print_by
    when "to" then @legend.help_queue_save_to
    else @legend.missing_command
    end
  end

  def help_third_position_of_the_array(parts)
    case parts[2]
    when "clear" then @legend.help_clear
    when "print" then @legend.help_print
    when "count" then @legend.help_count
    else @legend.missing_command
    end
  end

  def help_second_position_of_the_array(parts)
    case parts[1]
    when "queue" then @legend.help_queue_commands
    when "load"  then @legend.help_queue_load
    when "find"  then @legend.help.queue_find
    else @legend.missing_command
    end
  end
end

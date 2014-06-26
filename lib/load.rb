require_relative 'legends'

class Load
  def loading(parts)
    case
    puts "incomplete" when parts[1] == nil
    when parts[1] != nil
      @command    = parts[0]
      @parameters = parts[1..-1].pop
      puts "LOADING: #{parameters}"
      DB.read("./data/#{parameters}")
    end
  end
end

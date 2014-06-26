class Printer
  def print_attendees(sorted_info)
    long_line
    print "LAST NAME".ljust(20)  +
          "FIRST NAME".ljust(20) +
          "PHONE".ljust(13)      +
          "ZIPCODE".ljust(8)     +
          "CITY".ljust(20)       +
          "STATE".ljust(8)       +
          "ADDRESS".ljust(45)    +
          "EMAIL".ljust(20)
    print "\n"
    long_line
    sorted_info.each do |key|
    print "#{key.last_name.slice(0..16).ljust(20)}"     +
          "#{key.first_name.slice(0..16).ljust(20)}"    +
          "#{key.homephone.slice(0..9).ljust(13)}"      +
          "#{key.zipcode.ljust(8)}"                     +
          "#{key.city.slice(0..16).ljust(20)}"          +
          "#{key.state.ljust(8)}"                       +
          "#{key.street.slice(0..40).ljust(45)}"        +
          "#{key.email_address.slice(0..16).ljust(20)}"
    print "\n"
    end
  end

  def long_line
    print "--------------------------------------------------".blue +
    "---------------------------------------------------------".blue +
    "------------------------------------------------------\n".blue
  end
end

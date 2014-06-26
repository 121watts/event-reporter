class Printer
  def print_attendees(sorted_info)
    print "-----------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
    print "LAST".ljust(20) + "FIRST".ljust(15) +
    "ZIP".ljust(8) + "CITY".ljust(20) + "STATE".ljust(8) + "STREET".ljust(45) +
    "PHONE".ljust(13) + "EMAIL".ljust(1)
    print "\n"
    print "-----------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
      sorted_info.each do |key|
      print "#{key.last_name.ljust(20)} #{key.first_name.ljust(15)}" +
      "#{key.zipcode.ljust(8)}" +
      "#{key.city.ljust(20)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(45)}" +
      "#{key.homephone.ljust(13)}" + "#{key.email_address.ljust(1)}"
      print "\n"
    end
  end
end

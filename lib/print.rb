class Print

  attr_reader :sorted_info

  def initialize(sorted_info)
    @sorted_info = sorted_info
  end

  def print_attendees(sorted_info)
    print "LAST".ljust(11) + "FIRST".ljust(15) +
    "ZIP".ljust(10) + "CITY".ljust(15) + "STATE".ljust(8) + "STREET".ljust(40) +
    "PHONE".ljust(13) + "EMAIL".ljust(1)
    print "\n"
      sorted_info.each do |key|
      print "#{key.last_name.ljust(10)} #{key.first_name.ljust(15)}" +
      "#{key.zipcode.ljust(10)}" +
      "#{key.city.ljust(15)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(40)}" +
      "#{key.homephone.ljust(13)}" + "#{key.email_address.ljust(1)}"
      print "\n"
    end
  end

end

require_relative 'test_helper'

class PrintTest<Minitest::Test

  def filename
    @filename ||= File.absolute_path("../fixtures/big_test.csv", __FILE__)
  end

  def db
    DB.read(filename)
  end

  def test_prints_correct_names
    entries = db.find_by_first_name("Mary")
    print "FIRST".ljust(11) + "LAST".ljust(15) + "EMAIL".ljust(31) +
    "ZIP".ljust(10) + "CITY".ljust(15) + "STATE".ljust(8) + "STREET".ljust(40) +
    "PHONE".ljust(20)
    print "\n"
      entries.each do |key|
      print "#{key.last_name.ljust(10)} #{key.first_name.ljust(15)}" +
      "#{key.email_address.ljust(30)} #{key.zipcode.ljust(10)}" +
      "#{key.city.ljust(15)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(40)}" +
      "#{key.homephone.ljust(1)}"
      print "\n"
    end
  end
end

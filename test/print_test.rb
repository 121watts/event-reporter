require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/db'
require_relative '../lib/cleaner'

class PrintTest<Minitest::Test

  def filename
    @filename ||= File.absolute_path("../fixtures/big_test.csv", __FILE__)
  end

  def db
    DB.read(filename)
  end

  def test_prints_correct_names
    entries = db.find_by_first_name("John")
    print "LAST".ljust(11) + "FIRST".ljust(15) +
    "ZIP".ljust(10) + "CITY".ljust(15) + "STATE".ljust(8) + "STREET".ljust(40) +
    "PHONE".ljust(13) + "EMAIL".ljust(1)
    print "\n"
      entries.each do |key|
      print "#{key.last_name.ljust(10)} #{key.first_name.ljust(15)}" +
      "#{key.zipcode.ljust(10)}" +
      "#{key.city.ljust(15)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(40)}" +
      "#{key.homephone.ljust(13)}" + "#{key.email_address.ljust(1)}"
      print "\n"
    end
  end
  
    def test_sorts_by_first_name_when_last_name_is_requested
    entries = db.find_by_last_name("Jones")
    print "LAST".ljust(11) + "FIRST".ljust(15) +
    "ZIP".ljust(10) + "CITY".ljust(15) + "STATE".ljust(8) + "STREET".ljust(40) +
    "PHONE".ljust(13) + "EMAIL".ljust(1)
    print "\n"
      entries.each do |key|
      print "#{key.last_name.ljust(10)} #{key.first_name.ljust(15)}" +
      "#{key.zipcode.ljust(10)}" +
      "#{key.city.ljust(15)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(40)}" +
      "#{key.homephone.ljust(13)}" + "#{key.email_address.ljust(1)}"
      print "\n"
    end
  end

end

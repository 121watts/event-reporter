require_relative 'test_helper'



class DBTest<Minitest::Test

  def filename
    @filename ||= File.absolute_path("../fixtures/event_attendees_sample.csv", __FILE__)
  end

  def db
    DB.read(filename)
  end



end

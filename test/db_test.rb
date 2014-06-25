require_relative 'test_helper'
require 'pry'

class DBTest<Minitest::Test

  def filename
    @filename ||= File.absolute_path("../fixtures/event_attendees_sample.csv", __FILE__)
  end

  def db
    DB.read(filename)
  end

  def test_find_by_last_name
    entries = db.find_by_last_name("Nguyen").sort_by {|e| e.last_name}
    assert_equal 2, entries.length
  end

  def test_find_by_city
    entries = db.find_by_city("San Francisco").sort_by {|e| e.last_name}
    assert_equal 8, entries.length
  end

  def test_find_by_zip
    entries = db.find_by_zipcode('98109').sort_by {|e| e.last_name}
    assert_equal 2, entries.length
  end

  def test_find_by_state
    entries = db.find_by_state('CA').sort_by {|e| e.last_name}
    assert_equal 27, entries.length
  end

end

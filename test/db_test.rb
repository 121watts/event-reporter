gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/db'


class DBTest<Minitest::Test

  def filename
    @filename ||= File.absolute_path("../fixtures/things.csv", __FILE__)
  end

  def db
    DB.read(filename)
  end

  def test_find_by_name
    stuff = db.find_by(:name, "lamp")
    assert_equal 2, stuff.size
    assert_equal ["1", "2"], stuff.map{|item| item[:id]}
  end

  # def test_find_by_another_thing_place
  #   location = db.find_
  # end
end

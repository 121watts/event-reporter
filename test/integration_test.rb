require_relative 'test_helper'
require_relative '../lib/db'
require_relative '../lib/cleaner'
require_relative '../lib/entry'


class IntegrationTest < Minitest::Test

  def filename
    @filename ||= File.absolute_path("../fixtures/big_test.csv", __FILE__)
  end

  def db
    DB.read(filename)
  end

  def test_lookup_all_by_last_name
    event_reporter = DB.read(filename)
    entries = db.find_by_last_name('Nguyen')

    assert_equal 3, entries.length
    e1, e2, e3 = entries


    assert_equal "Allison Nguyen", e1.full_name
    assert_equal "20010", e1.zipcode

    assert_equal "Keskim Nguyen", e2.full_name
    assert_equal "27109", e2.zipcode

    assert_equal "Marta Nguyen", e3.full_name
    assert_equal "23220", e3.zipcode
  end

  def test_lookup_all_by_first_name
    event_reporter = DB.read(filename)
    entries = event_reporter.find_by_first_name('Shannon')

    assert_equal 15, entries.length

    e1,e2 = entries

    assert_equal "Shannon", e1.first_name
    assert_equal "Brackett", e1.last_name
    assert_equal "Blank", e1.city
    assert_equal "GU", e1.state
    assert_equal "06320", e1.zipcode

    assert_equal "Shannon", e2.first_name
    assert_equal "Davis", e2.last_name
    assert_equal "Seattle", e2.city
    assert_equal "WA", e2.state
    assert_equal "98122", e2.zipcode
  end

  def test_lookup_all_by_city
    event_reporter = DB.read(filename)
    entries = event_reporter.find_by_city("Raleigh")

    assert_equal 20, entries.length

    e1, e2 = entries

    assert_equal "Caryn", e1.first_name
    assert_equal "Conflenti", e1.last_name
    assert_equal "27603", e1.zipcode

    assert_equal "Ali", e2.first_name
    assert_equal "Easterling", e2.last_name
    assert_equal "27612", e2.zipcode
  end

def test_lookup_by_zipcode
    event_reporter = DB.read(filename)
    entries = event_reporter.find_by_zipcode("98109")

    assert_equal 5, entries.length

    e1, e2 = entries

    assert_equal "Tori", e1.first_name
    assert_equal "9", e1.last_name
    assert_equal "Seattle", e1.city
    assert_equal "WA", e1.state
    assert_equal "98109", e1.zipcode

    assert_equal "Emma", e2.first_name
    assert_equal "Baldwin", e2.last_name
    assert_equal "Seattle", e2.city
    assert_equal "WA", e2.state
    assert_equal "98109", e2.zipcode
  end

  def test_lookup_by_state
    event_reporter = DB.read(filename)
    entries = event_reporter.find_by_state("PR")

    assert_equal 8, entries.length

    e2, e1 = entries

    assert_equal "Melanie", e1.first_name
    assert_equal "Bobarnac", e1.last_name
    assert_equal "San Juan", e1.city
    assert_equal "PR", e1.state
    assert_equal "00921", e1.zipcode

    assert_equal "Chloe", e2.first_name
    assert_equal "Abbi", e2.last_name
    assert_equal "PR", e2.state
    assert_equal "00971", e2.zipcode
  end
end

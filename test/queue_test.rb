gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/queue'
require 'pry'

class QueueTest < Minitest::Test

  def attendee_data
    [
      {first_name: "Andrew", last_name: "Watkins", city: "Denver", state: "CO", zipcode: "80223"},
      {first_name: "Charles", last_name: "Watkins", city: "New York", state: "NY", zipcode: "12412"},
      {first_name: "Horacio", last_name: "Chavez", city: "Denver", state: "CA", zipcode: "90210"},
    ]
  end

  def attendee
    DB.new(attendee_data)
  end
binding.pry 
  def test_find_by_last_name
    entries = attendee.find_by_last_name("Watkins").sort_by {|e| e.last_name}
    assert_equal 2, entries.length
    andrew, charles = entries

    assert_equal "Andrew Watkins", andrew.full_name
    assert_equal "CO", andrew.state
    assert_equal "80223", andrew.zipcode

    assert_equal "Charles Watkins", charles.full_name
    assert_equal "NY", charles.state
    assert_equal "12412", charles.zipcode
  end

  def test_find_by_first_name
    entries = attendee.find_by_first_name("Andrew").sort_by {|e| e.first_name}
    assert_equal 1, entries.length
    andrew, charles = entries

    assert_equal "Andrew", andrew.first_name
    assert_equal "CO", andrew.state
    assert_equal "80223", andrew.zipcode
  end

  def test_find_by_city
    entries = attendee.find_by_city("Denver").sort_by {|e| e.city}
    assert_equal 2, entries.length
    andrew, horacio = entries

    assert_equal "Andrew", andrew.first_name
    assert_equal "Denver", andrew.city
    assert_equal "CO", andrew.state
    assert_equal "80223", andrew.zipcode

    assert_equal "Horacio", horacio.first_name
    assert_equal "Denver", horacio.city
    assert_equal "CA", horacio.state
    assert_equal "90210", horacio.zipcode
  end


end

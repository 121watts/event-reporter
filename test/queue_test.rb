gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
  def rows
    [
      {first_name: "Andrew", last_name: "Watkins", state: "CO", zipcode: "80223"},
      {first_name: "Charles", last_name: "Watkins", state: "NY", zipcode: "12412"},
      {first_name: "Horacio", last_name: "Chavez", state: "CA", zipcode: "90210"},
    ]
  end

  def queue
    @queue ||= Queue.new(rows)
  end

  def test_find_by_last_name
    entries = queue.find_by_last_name("Watkins").sort_by {|e| e.last_name}
    assert_equal 2, entries.length
    andrew, charles = entries

    assert_equal "Andrew Watkins", andrew.name
    assert_equal "CO", andrew.state
    assert_equal "80223", andrew.zipcode

    assert_equal "Charles Watkins", charles.name
    assert_equal "NY", charles.state
    assert_equal "12412", charles.zipcode
  end

end
gem     'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/event_reporter.rb'

class IntegrationTest < Minitest::Test
  def test_lookup_by_last_name
    event_reporter = EventReporter.new
    entries = event_reporter.lookup('Nguyen').sort_by {|e| e.last_name}

    assert_equal 2, entries.length
    e1, e2 = entries

    assert_equal "Allison Nguyen", e1.full_name_call
    assert_equal "20010", e1.zipcode

    assert_equal "Marta Nguyen", e2.full_name_call
    assert_equal "23220", e2.zipcode
  end
end

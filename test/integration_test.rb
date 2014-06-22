gem     'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/event_reporter.rb'


class IntegrationTest < Minitest::Test
  def test_lookup_by_last_name
    event_reporter = EventReporter.new
    entries = event_reporter.lookup_last('Nguyen').sort_by {|e| e.last_name}

    assert_equal 2, entries.length
    e1, e2 = entries

    assert_equal "Allison Nguyen", e1.full_name_call
    assert_equal "20010", e1.zipcode

    assert_equal "Marta Nguyen", e2.full_name_call
    assert_equal "23220", e2.zipcode
  end

  def test_lookup_by_first_name
    event_reporter = EventReporter.new
    entries = event_reporter.lookup_first('Shannon').sort_by {|e| e.first_name}

    assert_equal 2, entries.length

    e1,e2 = entries

    assert_equal "Shannon", e1.first_name_call
    assert_equal "Warner", e1.last_name_call
    assert_equal "Lyndeborough", e1.city_call
    assert_equal "NH", e1.state_call
    assert_equal "3082", e1.zipcode_call

    assert_equal "Shannon", e2.first_name_call
    assert_equal "Davis", e2.last_name_call
    assert_equal "Seattle", e2.city_call
    assert_equal "WA", e2.state_call
    assert_equal "98122", e2.zipcode_call

  end




end

require_relative 'test_helper'

class IntegrationTest < Minitest::Test
  def test_lookup_by_last_name
    event_reporter = EventReporter.new
    entries = event_reporter.lookup_last('Nguyen').sort_by {|e|
      e.first_name
    }

    assert_equal 2, entries.length
    e1, e2 = entries


    assert_equal "Allison Nguyen", e1.full_name
    assert_equal "20010", e1.zipcode

    assert_equal "Marta Nguyen", e2.full_name
    assert_equal "23220", e2.zipcode
  end

  def test_lookup_by_first_name
    event_reporter = EventReporter.new
    entries = event_reporter.lookup_first('Shannon').sort_by {|e| e.first_name}

    assert_equal 2, entries.length

    e1,e2 = entries

    assert_equal "Shannon", e1.first_name
    assert_equal "Warner", e1.last_name
    assert_equal "Lyndeborough", e1.city
    assert_equal "NH", e1.state
    assert_equal "03082", e1.zipcode

    assert_equal "Shannon", e2.first_name
    assert_equal "Davis", e2.last_name
    assert_equal "Seattle", e2.city
    assert_equal "WA", e2.state
    assert_equal "98122", e2.zipcode
  end

  def test_lookup_by_city
    event_reporter = EventReporter.new
    entries = event_reporter.lookup_city("Raleigh").sort_by {|e| e.city}

    e1, e2 = entries

    assert_equal "Jeff", e1.first_name
    assert_equal "Shamon", e1.last_name
    assert_equal "Raleigh", e1.city
    assert_equal "NC", e1.state
    assert_equal "27615", e1.zipcode

    assert_equal "Nate", e2.first_name
    assert_equal "Terry", e2.last_name
    assert_equal "Raleigh", e2.city
    assert_equal "NC", e2.state
    assert_equal "27617", e2.zipcode
  end

def test_lookup_by_zipcode
    event_reporter = EventReporter.new
    entries = event_reporter.lookup_zipcode("98109").sort_by {|e| e.zipcode}

    e1, e2 = entries

    assert_equal "Paige", e1.first_name
    assert_equal "Tompkins", e1.last_name
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
    event_reporter = EventReporter.new
    entries = event_reporter.lookup_state("PR").sort_by {|e| e.state}

    e2, e1 = entries

    assert_equal "Angela", e1.first_name
    assert_equal "Burns", e1.last_name
    assert_equal "Adjuntas", e1.city
    assert_equal "PR", e1.state
    assert_equal "00601", e1.zipcode

    assert_equal "Laura", e2.first_name
    assert_equal "Rapetsky", e2.last_name
    assert_equal "San Juan", e2.city
    assert_equal "PR", e2.state
    assert_equal "00924", e2.zipcode
  end


end

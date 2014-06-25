require_relative 'test_helper'


class EventReporterTest < Minitest::Test
  def queue
    @queue ||= Minitest::Mock.new
  end

  def test_lookup_by_last_name
    event_reporter = EventReporter.new()
    queue.expect(:find_by_last_name, [], ["Nguyen"])
    event_reporter.lookup_last('Nguyen')
    queue.verify
  end


  # def test_lookup_by_first_name
  #   event_reporter = EventReporter.new()
  #   queue.expect(:find_by_first_name, [], ["Shannon"])
  #   event_reporter.lookup_first('Shannon')
  #   queue.verify
  # end
  #
  # def test_lookup_by_city
  #   event_reporter = EventReporter.new()
  #   queue.expect(:find_by_city, [], ["Detroit"])
  #   event_reporter.lookup_city('Detroit')
  #   queue.verify
  # end
  #
  # def test_lookup_by_state
  #   event_reporter = EventReporter.new()
  #   queue.expect(:find_by_state, [], ["CO"])
  #   event_reporter.lookup_state('CO')
  #   queue.verify
  # end
  #
  # def test_lookup_by_zipcode
  #   event_reporter = EventReporter.new()
  #   queue.expect(:find_by_zipcode, [], ["90210"])
  #   event_reporter.lookup_zipcode('90210')
  #   queue.verify
  # end
end

gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/event_reporter'

class EventReporterTest < Minitest::Test
  def queue
    @queue ||= Minitest::Mock.new
    end

  def test_lookup_by_last_name
    event_reporter = EventReporter.new
    queue.expect(find_by_last_name, [], ["Nguyen"])
    phone_book.lookup('Nguyen')
    queue.verify
  end

end

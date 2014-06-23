require_relative 'queue'
require_relative 'db'

class EventReporter

  attr_reader :queue, :db

  def initialize(queue = Queue.new('../data'))
    @queue = queue
    @db    = db
  end

  def lookup_last(name)
    queue.find_by_last_name(name)
  end

  def lookup_first(name)
    queue.find_by_first_name(name)
  end

  def lookup_city(city)
    queue.find_by_city(city)
  end

  def lookup_state(state)
    queue.find_by_state(state)
  end

  def lookup_zipcode(zipcode)
    queue.find_by_zipcode(zipcode)
  end

end

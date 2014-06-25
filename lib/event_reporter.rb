require_relative 'queue'
require_relative 'db'

class EventReporter

  attr_reader :db

  def initialize
    @db = db
  end

  def lookup_last(name)
    db.find_by_last_name(name)
  end

  def lookup_first(name)
    db.find_by_first_name(name)
  end

  def lookup_city(city)
    db.find_by_city(city)
  end

  def lookup_state(state)
    db.find_by_state(state)
  end

  def lookup_zipcode(zipcode)
    db.find_by_zipcode(zipcode)
  end

end

require_relative 'entry'
require_relative 'db'



class Queue
  attr_reader :entries, :db

  def initialize(db)
    @entries   = []
    @db        = DB.new('../data/event_attendees_sample.csv')
  end

  def find_by_last_name(last)
    entries << db.select { |entry| entry.last_name == last }
  end

  def find_by_first_name(first)
    entries << db.select{ |entry| entry.first_name == first }
  end

  def find_by_city(city)
    entries << db.select{ |entry| entry.city == city }
  end

  def find_by_zipcode(zipcode)
    entries << db.select{ |entry| entry.zipcode == zipcode }
  end

  def find_by_state(state)
    entries << db.select{ |entry| entry.state == state }
  end

  def clear
    @entries = []
  end

end

require_relative 'entry'
require_relative 'db'


class Queue
  attr_reader :attendees, :db

  def initialize(db)
    @attendees   = []
    @db          = DB.new('./event_attendees_sample.csv')
  end

  def find_by_last_name(last)
    attendees << db.find_by_last_name(last)
  end

  def find_by_first_name(first)
    attendees << db.find_by_first_name(first)
  end

  def find_by_city(city)
    attendees << db.find_by_city(city)
  end

  def find_by_zipcode(zipcode)
    attendees << db.find_by_zipcode(zipcode)
  end

  def find_by_state(state)
    attendees << db.find_by_state(state)
  end

  def clear
    @attendees = []
  end

end

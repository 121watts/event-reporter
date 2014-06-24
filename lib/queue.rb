require_relative 'entry'
require_relative 'db'
require 'pry'


class Queue
  attr_reader :attendees, :db

  def initialize(db)
    @attendees   = []
    @db          = DB.new('./event_attendees_sample.csv')
  end

  def find_by_last_name(last)
    attendees << db.select { |entry| entry.last_name == last }
  end
binding.pry
  def find_by_first_name(first)
    attendees << db.select{ |entry| entry.first_name == first }
  end

  def find_by_city(city)
    attendees << db.select{ |entry| entry.city == city }
  end

  def find_by_zipcode(zipcode)
    attendees << db.select{ |entry| entry.zipcode == zipcode }
  end

  def find_by_state(state)
    attendees << db.select{ |entry| entry.state == state }
  end

  def clear
    @attendees = []
  end

end

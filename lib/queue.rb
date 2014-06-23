require_relative 'entry'

class Queue

  attr_reader :entries

  def self.in(directory)
    file = File.join(directory, 'event_attendees_sample.csv')
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.map do |row|
      Entry.new(row)
    end
    new(rows)
  end

  def initialize(entries)
    @entries = entries
  end

  def find_by_last_name(last)
    entries.select {|entry| entry.last_name == last}
  end

  def find_by_first_name(first)
    entries.select{|entry| entry.first_name == first}
  end

  def find_by_city(city)
    entries.select{|entry| entry.city == city}
  end

  def find_by_zipcode(zipcode)
    entries.select{|entry| entry.zipcode == zipcode}
  end

  def find_by_state(state)
    entries.select{|entry| entry.state == state}
  end

end

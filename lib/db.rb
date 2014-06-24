require 'csv'
require_relative 'entry'

class DB
  def self.read(filename)
    new(CSV.open(filename, headers: true, header_converters: :symbol))
  end

  attr_reader :records

  def initialize(csv_records)
    @records = build_attendees(csv_records)
  end

  def build_attendees(data)
    data.collect do |row|
      Entry.new(row)
    end
  end

  def find_by_last_name(last)
    records.select { |entry| entry.last_name == last }
  end

  def find_by_first_name(first)
    records.select { |entry| entry.first_name == first }
  end

  def find_by_city(city)
    records.select { |entry| entry.city == city }
  end

  def find_by_zipcode(zipcode)
    records.select { |entry| entry.zipcode == zipcode }
  end

  def find_by_state(state)
    records.select { |entry| entry.state == state }
  end

end

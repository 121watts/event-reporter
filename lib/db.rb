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
    records.select { |entry| entry.last_name == last }.sort_by {|e| e.first_name}
  end

  def find_by_first_name(first)
    records.select { |entry| entry.first_name == first }.sort_by {|e| e.last_name}
  end

  def find_by_city(city)
    records.select { |entry| entry.city == city }.sort_by {|e| e.last_name}
  end

  def find_by_zipcode(zipcode)
    records.select { |entry| entry.zipcode == zipcode }.sort_by {|e| e.last_name}
  end

  def find_by_state(state)
    records.select { |entry| entry.state == state }.sort_by {|e| e.last_name}
  end

  # THIS WORKS BUT DOESNT BELONG IN HERE
  # def print_attendees
  #   print "FIRST".ljust(11) + "LAST".ljust(15) + "EMAIL".ljust(31) +
  #   "ZIP".ljust(10) + "CITY".ljust(15) + "STATE".ljust(8) + "STREET".ljust(20) +
  #   "PHONE".ljust(20)
  #   print "\n"
  #     @SOMEUNIVERSIALLYAVAILABLETHING.each do |key|
  #     print "#{key.last_name.ljust(10)} #{key.first_name.ljust(15)}" +
  #     "#{key.email_address.ljust(30)} #{key.zipcode.ljust(10)}" +
  #     "#{key.city.ljust(15)}" + "#{key.state.ljust(8)}" + "#{key.street.ljust(20)}" +
  #     "#{key.homephone.ljust(1)}"
  #     print "\n"
  #   end
  # end


end

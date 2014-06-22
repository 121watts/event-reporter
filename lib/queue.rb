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

  def find_by_last_name(name)
    entries.select {|entry| entry.last_name == name}
  end

end

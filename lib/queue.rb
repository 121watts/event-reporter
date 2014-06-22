class Queue

  attr_reader :rows

  def self.in(directory)
    new
  end

  def initialize(rows)
    @rows = rows
  end

  def find_by_last_name(name)
    rows.select {|person| person[:last_name] == name}
  end

end

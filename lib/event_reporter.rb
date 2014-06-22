require_relative 'queue'

class EventReporter

  attr_reader :queue

  def initialize(queue=Queue.in('./data'))
    @queue = queue
  end

  def lookup(name)
    queue.find_by_last_name(name)
  end

end

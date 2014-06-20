gem     'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/load.rb'

class IntegrationTest < Minitest::Test

  def setup
    @load  = Load.new
    @queue = Queue.new(load)
  end


  def test_queue_starts_empty
    entries = queue.look_up('')
    assert_equal 0, entries.count
  end

end

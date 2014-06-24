gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cleaner'
#require_relative '../data/event_attendees_sample.csv'

class CleanerTest < Minitest::Test
  def test_first_name_has_right_format
    person = Cleaner.new(name)
  end
end

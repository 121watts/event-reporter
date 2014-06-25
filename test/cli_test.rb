require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'
require_relative '../lib/db'
require_relative '../lib/event_reporter'

class CLITest < Minitest::Test
  attr_reader :cli

  # def setup #NEEDS TO UPDATE THE SOURCE
  #   repository = DB.in("./test/fixtures")
  #   event_reporter = EventReporter.new(repository)
  #   @cli ||= CLI.new(event_reporter)
  # end
  #
  #   def test_it_exists
  #     assert cli
  #   end

end

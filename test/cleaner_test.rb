gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cleaner'
require 'pry'


class CleanerTest < Minitest::Test

  def test_it_parses_zip_code
    queue = File.read('./test/fixtures/small_sample.txt')
  binding.pry

    queue.to_a
    assert queue.clean_zipcode.include?('00703')
  end

end

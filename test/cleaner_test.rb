gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cleaner'

class CleanerTest < Minitest::Test

  def test_it_parses_zip_code
    parsed_data = Cleaner.new
    assert parsed_data.clean_zipcode('703').include?('00703')
  end

  def test_it_parses_everything_else
    parsed_data = Cleaner.new
    assert_equal '1234567891', parsed_data.clean_phone('(123 ) 456.78 91')
    assert_equal 'John',       parsed_data.clean_first_name('   john')
    assert_equal 'Denver',     parsed_data.clean_city('denver    ')
    assert_equal 'CO',         parsed_data.clean_state('  cO')
    assert_equal '00000',      parsed_data.clean_zipcode('')
  end


end

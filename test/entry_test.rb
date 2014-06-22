gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/entry'

class EntryTest < Minitest::Test
  def test_entry_attributes
    data = {
      id: '1',
      regdate: '11/12/08 10:47',
      first_name: 'Alice',
      last_name: 'Smith',
      email_address: 'alice@jumpstartlab.com',
      homephone: '111.111.1111',
      street: '1600 Glenarm Place',
      city: 'Denver',
      state: 'CO',
      zipcode: '80202'
    }
    entry = Entry.new(data)

    assert_equal '1', entry.id_call
    assert_equal '11/12/08 10:47', entry.regdate_call
    assert_equal 'Alice', entry.first_name_call
    assert_equal 'Smith', entry.last_name_call
    assert_equal 'alice@jumpstartlab.com', entry.email_address_call
    assert_equal '111.111.1111', entry.homephone_call
    assert_equal '1600 Glenarm Place', entry.street_call
    assert_equal 'Denver', entry.city_call
    assert_equal 'CO', entry.state_call
    assert_equal '80202', entry.zipcode_call
  end
end

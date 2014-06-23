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

    assert_equal '1', entry.id
    assert_equal '11/12/08 10:47', entry.regdate
    assert_equal 'Alice', entry.first_name
    assert_equal 'Smith', entry.last_name
    assert_equal 'alice@jumpstartlab.com', entry.email_address
    assert_equal '111.111.1111', entry.homephone
    assert_equal '1600 Glenarm Place', entry.street
    assert_equal 'Denver', entry.city
    assert_equal 'CO', entry.state
    assert_equal '80202', entry.zipcode
  end
end

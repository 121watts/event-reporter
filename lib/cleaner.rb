class Cleaner

  def clean_first_name(first_name)
    first_name.chomp.capitalize
  end

  def clean_last_name(last_name)
    last_name.chomp.capitalize
  end

  def clean_homephone(homephone)
    phone = homephone.gsub()[-10..-1]
    "(#{phone[0..2]}) #{phone[3..5]}-#{phone[6..10]}"
  end

  def clean_city(city)
    city.capitalize
  end

  def clean_state(state)
    state.upcase[0..1]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end

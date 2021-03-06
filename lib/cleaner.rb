class Cleaner

  def clean_first_name(first_name)
    first_name.strip.capitalize
  end

  def clean_last_name(last_name)
    last_name.strip.capitalize
  end

  def clean_phone(homephone)
    homephone.to_s.scan(/\d/).join.rjust(10, "0")[0..9]
  end

  def clean_city(city)
    city.to_s.strip.split.map(&:capitalize)*' '
  end

  def clean_state(state)
    state.to_s.strip.upcase[0..1]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end

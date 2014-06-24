class Cleaner

##how is this data getting passed to Cleaner?
##hash, array, array of hashes?

  def clean_first_name(first_name)
      first_name.strip.capitalize
  end

  def clean_last_name(last_name)
    last_name.strip.capitalize
  end

  def clean_homephone(homephone)
    phone = homephone.scan(/\d/).join
  end

  def clean_city(city)
    city.capitalize
  end

  def clean_state(state)
    state.upcase[0..1]
  end

  def clean_zipcode
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end


# contents.each do |row|
#     id = row[0]
#
#     name = row[:first_name]
#
#     phone_number = row[:homephone]
#
#     zipcode = clean_zipcode(row[:zipcode])
#
#     legislators = legislators_by_zipcode(zipcode)
#
#     form_letter = erb_template.result(binding)
#
#     save_thank_you_letters(id, form_letter)
#   end

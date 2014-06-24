class Cleaner

##Cleaner will get passed an array of Entry objects
##So, how do I pass the symbols into the cleaner
##and then put them into the queue
##then, once they are in the queue how do i print them?

  def clean_first_name(first_name)
      first_name.strip.capitalize
  end

  def clean_last_name(last_name)
    last_name.strip.capitalize
  end

  def clean_phone(homephone)
    homephone.scan(/\d/).join
  end

  def clean_city(city)
    city.strip.capitalize
  end

  def clean_state(state)
    state.strip.upcase[0..1]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end

#Somethings like this to go through the CSV?
#Parse CSV before searching?
#
#
# contents.each do |row|
#     id = row[0]
#
#     first_name = row[:first_name]
#
#     phone_number = row[:homephone]
#
#     zipcode = clean_zipcode(row[:zipcode])
# end

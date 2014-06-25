class Entry
  attr_reader :id,
              :regdate,
              :first_name,
              :last_name,
              :email_address,
              :homephone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data)
    cleaner        = Cleaner.new
    @id            = data[:id]
    @regdate       = data[:regdate]
    @first_name    = cleaner.clean_first_name(data[:first_name])
    @last_name     = cleaner.clean_last_name(data[:last_name])
    @email_address = data[:email_address]
    @homephone     = cleaner.clean_phone(data[:homephone])
    @street        = data[:street]
    @city          = cleaner.clean_city(data[:city])
    @state         = cleaner.clean_state(data[:state])
    @zipcode       = cleaner.clean_zipcode(data[:zipcode])
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

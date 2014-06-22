class Entry

  attr_reader :id,:regdate,
              :first_name,
              :last_name,
              :email_address,
              :homephone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @id = data[:id]
    @regdate = data[:regdate]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @email_address = data[:email_address]
    @homephone = data[:homephone]
    @street = data[:street]
    @city = data[:city]
    @state = data[:state]
    @zipcode = data[:zipcode]
    @full_name = "#{first_name} #{last_name}"
  end

  def id_call
    "#{id}"
  end

  def regdate_call
    "#{regdate}"
  end

  def full_name_call
    "#{first_name} #{last_name}"
  end

  def first_name_call
    "#{first_name}"
  end

  def last_name_call
    "#{last_name}"
  end

  def email_address_call
    "#{email_address}"
  end

  def homephone_call
    "#{homephone}"
  end

  def street_call
    "#{street}"
  end

  def city_call
    "#{city}"
  end

  def state_call
    "#{state}"
  end

  def zipcode_call
    "#{zipcode}"
  end
end

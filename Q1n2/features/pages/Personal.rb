class Personal
  include PageObject
  #@userEmail= nil

 # page elements
  text_field(:emailAdd, :id=>"email_create")
  form(:personInfoForm, :id=>"account-creation_form")
  div(:male,:id=>"uniform-id_gender1")
  div(:female,:id=>"uniform-id_gender2")
  text_field(:custFirstName, :id=>"customer_firstname")
  text_field(:custLastName, :id=>"customer_lastname")
  text_field(:email, :id=>"email")
  text_field(:password, :id=>"passwd")
  text_field(:firstNameAdd, :id=>"firstname")
  text_field(:lastNameAdd, :id=>"lastname")
  text_field(:address, :id=>"address1")
  text_field(:city, :id=>"city")
  select_list(:state, :id=>"id_state")
  text_field(:postalCode, :id=>"postcode")
  select_list(:country, :id=>"id_country")
  text_field(:mobilePhone, :id=>"phone_mobile")
  text_field(:aliasAddress, :id=>"alias")
  button(:accountSubmission, :id=>"submitAccount")


  def setUserEmail(custEmail)
    @userEmail = custEmail
  end

  def assertPageLoaded
    sleep 3
    assert_it ('Personal info page is displayed') {personInfoForm_element.exists?}
  end

  def fillUpCompulsoryData
    fileName= $project_file_path+$config["data"]
    File.read(fileName).each_line{ |line|
      dataToBeFilled = line.split(',')
      if (dataToBeFilled[0]=='mrs')
        female_element.fire_event :click
      else
        male_element.fire_event :click
      end
      self.custFirstName = dataToBeFilled[1]
      self.custLastName = dataToBeFilled[2]
      self.password =dataToBeFilled[3]
      #self.firstNameAdd =dataToBeFilled[4]
      #self.lastNameAdd =dataToBeFilled[5]
      self.address =dataToBeFilled[6]
      self.city =dataToBeFilled[7]
      self.state_element.option(text: dataToBeFilled[8]).select
      self.postalCode =dataToBeFilled[9]
      self.country_element.option(text: dataToBeFilled[10]).select
      self.mobilePhone =dataToBeFilled[11]
      self.aliasAddress =dataToBeFilled[12]
    }
  end

  def clickAccountSubmission
    accountSubmission_element.fire_event :click
    sleep 5
  end

end

class Signin
  include PageObject

  #page elements
  text_field(:emailAdd, :id=>"email_create")
  button(:createAcctButton, :id=>"SubmitCreate")
  text_field(:email, :id=>"email")
  text_field(:password,:id=>"passwd")
  button(:signin,:id=>"SubmitLogin")
  div(:error, :class=>"alert alert-danger")


  def assertPageLoaded
    assert_it ('Sign in page is displayed') {emailAdd_element.exists?}
  end

  def enterEmailAddressForSignUP
    emailAdd.clear
    #email = dynamicEmailId
    #$site.personal_page.setUserEmail(email)
    self.emailAdd = dynamicEmailId
    sleep 2
  end

  def clickCreateAnAccount
    createAcctButton_element.fire_event :click
  end

  def dynamicEmailId
    return  "visalakshiTest"+ Random.rand(1000).to_s+"@gmail.com"
  end

  def enterCredentials(emailId,passwd)
    email.clear
    self.email = emailId
    password.clear
    self.password = passwd
  end

  def clickSignIn
    signin_element.fire_event :click
  end


  def loginValidation(emailId,passwd)
    credentials = true
    fileName= $project_file_path+$config["users"]
    #assumes file has at least one data
    File.read(fileName).each_line{ |line|
      if (!line.delete!("\n").eql?(emailId+","+passwd))
        credentials = false
      else
        credentials = true
        break
      end
    }
    if (!credentials)
      assert_it ('Login works as expected'){@browser.div(class: /#{"alert-danger"}/).text.include?("There is 1 error")}
    else
      $site.accounts_page.assertPageLoaded
    end
  end

  def enterEmailAdd(emailId)
    email.clear
    self.email = emailId
    self.password =""
    if (emailId.include?(".com")&& emailId.include?("@"))
      assert_it ('Validation done correctly on valid email Address'){@browser.div(class: /#{"form-ok"}/).present?}
    else
      assert_it ('Validation done correctly on invalid email Address'){@browser.div(class: /#{"form-error"}/).present?}
    end
  end

end

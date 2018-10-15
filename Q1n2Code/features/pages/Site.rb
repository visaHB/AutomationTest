require './features/pages/Home'
require './features/pages/Signin'
require './features/pages/Personal'
require './features/pages/Accounts'

class Site
  def initialize(browser)
    @browser = browser
    @home_page = Home.new(@browser)
    @signin_page = Signin.new(@browser)
    @personal_page= Personal.new(@browser)
    @accounts_page=Accounts.new(@browser)
  end

  def home_page
    @home_page
  end

  def signin_page
    @signin_page
  end

  def personal_page
    @personal_page
  end

  def accounts_page
    @accounts_page
  end

end
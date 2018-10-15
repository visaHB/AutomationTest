class Home
  include PageObject

 # page elements
  link(:signIn, :href=>"http://automationpractice.com/index.php?controller=my-account")

  def goToHomePage
    @browser.goto $config["automation_url"]
  end

  def goToSignInPage
    signIn_element.fire_event :click
  end
end

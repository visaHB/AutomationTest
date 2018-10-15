class Accounts
  include PageObject

 # page elements
  span(:accounts, :text=>"Order history and details")

  def assertPageLoaded
    assert_it ('Accounts page is displayed') {accounts_element.exists?}
  end
end

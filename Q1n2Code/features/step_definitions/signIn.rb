Then(/^user logs in with credentials (.*) and (.*)$/) do |email, password|
  $site.signin_page.enterCredentials(email,password)
  $site.signin_page.clickSignIn
  $site.signin_page.loginValidation(email,password)
  #$site.accounts_page.assertPageLoaded
end

Then(/^check if email validation is done once user enters email add (.*)$/) do |email|
  $site.signin_page.enterEmailAdd(email)
end
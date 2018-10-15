Given(/^user goes to home page$/) do
  $site.home_page.goToHomePage
end

Then(/^user clicks on signin$/) do
  $site.home_page.goToSignInPage
  $site.signin_page.assertPageLoaded
end

Then(/^user enters email id$/) do
  $site.signin_page.enterEmailAddressForSignUP
  $site.signin_page.clickCreateAnAccount
  $site.personal_page.assertPageLoaded
end

Then(/^user enters personal info$/) do
  $site.personal_page.fillUpCompulsoryData
  $site.personal_page.clickAccountSubmission
  $site.accounts_page.assertPageLoaded
end
Feature: SignIn

  Scenario Outline: Test to verify that various login input works as expected
    Given user goes to home page
    Then user clicks on signin
    Then user logs in with credentials <email> and <password>

    Examples:
      |email|password|
      |   |      |
      |   |password|
      |test@email.com||
      |test@email.com|test|
      |emailTest@email.com|password|

  Scenario Outline: Test to verify that login input validations appear
      Given user goes to home page
      Then user clicks on signin
      Then check if email validation is done once user enters email add <email>

     Examples:
     |email|
     |test |
     |test.com|
     |test@   |
     |test@test.com|



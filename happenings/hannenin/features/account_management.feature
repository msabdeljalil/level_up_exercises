Feature: Account Management
   In order to add events to my calendar
   As a user
   I want to create an account to login to the system

  Scenario: Successful account creation
   Given I am a new user to the site
   When I create an account
   Then I should be successfully signed up

 Scenario: Successful account login
    Given a login with "test@test.com" and password "password"
    When I login with "test@test.com" and password "password"
    Then I should be successfully signed in
#
#   Scenario: Successful logout
#      Given a valid user name "csr@somedomain.com" and password "secret"
#      When I logout
#      Then the system should log me out of the system
#      And I should not be able to use the features available only to logged in users

#   Scenario Outline: Failed Login
#      Given the login id is "" and password is ""
#      When I enter "" and ""
#      Then the error message should be ""

#   Scenarios: wrong login credentials
#      | login           | password         | error                             |
#      | wrong email     | correct password | Email not found                   |
#      | correct email   | wrong password   | Wrong password                    |
#      | wrong email     | wrong password   | Login and Password does not match |
#       
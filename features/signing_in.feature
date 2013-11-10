Feature: Signing In
  In order to access my account
  As a user of Chitter
  I need to be able to sign in

  Scenario: Signing in
    Given That I have an account but am not logged in
    When I click the Log In link
    And enter my username and password
    Then I should see a welcome back message

  Scenario: Trying to sign in with incorrect credentials
    Given That I have an account but am not logged in
    When I click the Log In link
    And enter my username and password incorrectly
    Then I should see an error message informing me so

  Scenario: Trying to sign in when already signed in
    Given that I have an account and am logged in
    When I visit the Log In page
    Then I should see a message telling me I'm already logged in
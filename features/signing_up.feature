Feature: Signing up to Chitter
  In order to add my insights to Chitter
  As someone who has many pearls of wisdom to share
  I need to be able to create an account on Chitter

  Scenario: Signing up to Chitter
    Given I follow the "Sign Up" link
    When I enter my details and press "Sign Me Up!"
    Then I should have an account on Chitter
    And I should see a welcome message

  Scenario: Entering non-matching passwords when signing up
    Given I follow the "Sign Up" link
    When I enter my details but put differet passwords in and press "Sign Me Up!"
    Then I should see an error message

  Scenario: Trying to sign up with a taken email or username
    Given I follow the "Sign Up" link
    When I enter an email or username that already exists on the system
    Then I should see an error message telling me so
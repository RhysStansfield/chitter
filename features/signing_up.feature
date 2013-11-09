Feature: Signing up to Chitter
  In order to add my insights to Chitter
  As someone who has many pearls of wisdom to share
  I need to be able to create an account on Chitter

  Scenario: Signing up to Chitter
    Given I follow the "Sign Up" link
    When I enter my details and press "Sign Me Up!"
    Then I should have an account on Chitter
    And I should see a welcome message
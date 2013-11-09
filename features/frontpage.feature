Feature: The home page
  In order to waste lots of time online
  As someone who loves wasting time
  I need to be able to visit Chitter!

  Scenario: Visiting the homepage
    Given that I visit the home page
    Then I should see content "Chitter!"

  Scenario: Viewing messages on the home page
    Given that I came to this site to read messages
    When I am on the home page
    Then I should see all messages!
    And the names of the message posters
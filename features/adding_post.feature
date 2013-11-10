Feature: Adding a post
  In order to share my thoughts
  As a user of Chitter
  I need to be able to add posts

  Scenario: Adding a post
    Given that I have an account
    And am logged in
    When I click the Add Post button
    And write a post and click Post
    Then my post should be on the home page

  Scenario: Trying to post when not logged in
    Given that I am not logged in and visit the add post page
    Then I should see a message telling me to log in
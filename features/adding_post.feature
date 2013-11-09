Feature: Adding a post
  In order to share my thoughts
  As a user of Chitter
  I need to be able to add posts

  Background: Logged in
    Given that I have an account
    And am logged in

  Scenario: Adding a post
    When I click the Add Post button
    And write a post and click Post
    Then my post should be on the home page
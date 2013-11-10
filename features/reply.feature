Feature: Replying to posts
  In order to make Chitter more interactive
  As someone who likes chatting with people online
  I want to be able to reply to other users Peeps

  Scenario: Replying to a peep
    Given that I have an account
    And there is a post I want to reply to
    When I click the reply button on a peep and post a response
    Then I should see my reply on the homepage
Feature: Signing out
  In order to keep my account secure when I'm not around
  As a user of Chitter
  I need to be able to sign out

  Background: Being an existing user
    Given that I have an account

  Scenario: Signing out
    Given that I am signed in
    When I click Sign Out
    Then I should no longer be signed in
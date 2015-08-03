Feature: New users are created with privileges
  I want new users to automatically be granted their roles
  So that the signup process is most efficient

  Scenario: I create a new organizer account
    Given I request a new account
    And I click the confirmation link
    And my email address is on a list of approved organizers
    Then my account is created
    And my role is organizer

  Scenario: I create a new curator account
    Given I request a new account
    And I click the confirmation link
    And my email address is on a list of approved curators
    Then my account is created
    And my role is curator

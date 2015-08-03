Feature: I want to disalllow weak passwords
  I want weak passwords to be rejected
  So that database privacy and integrity is preserved

  Background:
    Given I am on the login page

  Context: User enters a weak password
    When I enter a weak password
    Then I am immediately prompted to make it stronger



